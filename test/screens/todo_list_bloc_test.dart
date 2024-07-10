import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/todo_provider.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/todo_list_bloc.dart';

import '../mocks/fake_local_database.dart';
import '../mocks/fake_secure_storage.dart';
import '../mocks/mock_remote_database.dart';
import '../mocks/mock_remote_provider.dart';

void main() async {
  late MockRemoteDatabase database;
  late ToDoListBloc bloc;
  late MockRemoteProvider remote;
  late FakeLocalDatabase local;
  late FakeSecureStorage storage;

  late DeviceIdProvider deviceIdProvider;

  const des = 'Test description';
  final time = DateTime(2024, 7, 10, 14, 23, 10);
  late ToDo createdToDo;
  group('TodoListBloc:', () {
    setUpAll(() {
      registerFallbackValue(const ToDo.justCreated());
      registerFallbackValue(FakeCompanion());
    });
    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();

      // Set up fresh copy of bloc
      database = MockRemoteDatabase();
      remote = MockRemoteProvider(database);
      local = FakeLocalDatabase();
      storage = FakeSecureStorage();
      deviceIdProvider = await DeviceIdProvider.create(storage: storage);
      final toDoProvider = ToDoProvider(
        localDatabase: local,
        onlineProvider: remote,
        deviceIdProvider: deviceIdProvider,
      );

      bloc = ToDoListBloc(toDoProvider);

      createdToDo = ToDo.justCreated(
        description: des,
        createdAt: time,
        changedAt: time,
        id: '1',
        lastUpdatedBy: deviceIdProvider.deviceId,
      );

      when(() => remote.database.createToDo(any())).thenAnswer((_) async => createdToDo);
    });
    group('Internet is connected:', () {
      setUp(() async {
        WidgetsFlutterBinding.ensureInitialized();

        // Provide default implementations for initialization
        when(remote.database.getToDoList).thenAnswer((_) async => <ToDo>[]);
        when(() => remote.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => <ToDo>[]);
      });
      test('Initial state is correct', () {
        expect(bloc.state, const LoadingState());
      });

      blocTest<ToDoListBloc, ToDoListState>(
        'Get main state from online',
        build: () => bloc,
        expect: () => [
          const MainState(
            todos: [],
            networkConnectionPresent: true,
            query: ToDoListQuery(),
            showDone: true,
          ),
        ],
      );

      blocTest<ToDoListBloc, ToDoListState>(
        'Create todo and get list for online',
        build: () => bloc,
        act: (bloc) {
          bloc
            ..add(const CreateEvent())
            ..add(const SaveJustCreatedEvent(des))
            ..add(const LoadEvent());
        },
        expect: () {
          final stateAfterSaved = MainState(
            todos: [createdToDo],
            networkConnectionPresent: true,
            query: const ToDoListQuery(),
            showDone: true,
          );
          return [
            const MainState(
              todos: [],
              networkConnectionPresent: true,
              query: ToDoListQuery(),
              showDone: true,
            ),
            const MainState(
              todos: [ToDo.justCreated()],
              networkConnectionPresent: true,
              query: ToDoListQuery(),
              showDone: true,
            ),
            stateAfterSaved,
            const LoadingState(),
            stateAfterSaved,
          ];
        },
      );

      test('Delete todo and get list for online', () async {
        when(() => remote.database.deleteToDo(any())).thenAnswer((_) async => createdToDo);

        await bloc.stream.first; // get init state

        bloc
          ..add(const CreateEvent())
          ..add(const SaveJustCreatedEvent(des));
        final state1 = (await bloc.stream.first) as MainState; // created
        expect(state1.todos, hasLength(1));

        final state2 = (await bloc.stream.first) as MainState; // saved
        expect(state2.todos, hasLength(1));

        final id = state2.todos.first.id!;
        bloc.add(DeleteEvent(id)); //  deleted
        final state3 = (await bloc.stream.first) as MainState;

        expect(state3.todos, hasLength(0)); // not showing to user

        final todoInDatabase = await local.getToDoById(id: id); // deleted from database as well fromm online
        expect(todoInDatabase, isNull);
      });
    });

    group('Internet not connected:', () {
      setUp(() async {
        // Provide default implementations for initialization
        when(remote.database.getToDoList).thenAnswer((_) async => null);
        when(() => remote.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => null);
      });

      blocTest<ToDoListBloc, ToDoListState>(
        'Get main state from local',
        build: () => bloc,
        expect: () => [
          const MainState(
            todos: [],
            networkConnectionPresent: false,
            query: ToDoListQuery(),
            showDone: true,
          ),
        ],
      );

      blocTest<ToDoListBloc, ToDoListState>(
        'Create todo and get list for offline',
        build: () => bloc,
        act: (bloc) {
          bloc
            ..add(const CreateEvent())
            ..add(const SaveJustCreatedEvent(des))
            ..add(const LoadEvent());
        },
        expect: () {
          final stateAfterSaved = MainState(
            todos: [createdToDo],
            networkConnectionPresent: false,
            query: const ToDoListQuery(),
            showDone: true,
          );
          return [
            const MainState(
              todos: [],
              networkConnectionPresent: false,
              query: ToDoListQuery(),
              showDone: true,
            ),
            const MainState(
              todos: [ToDo.justCreated()],
              networkConnectionPresent: false,
              query: ToDoListQuery(),
              showDone: true,
            ),
            stateAfterSaved,
            const LoadingState(),
            stateAfterSaved,
          ];
        },
      );

      test('Delete todo and get list for offline', () async {
        when(() => remote.database.deleteToDo(any())).thenAnswer((_) async => null);

        await bloc.stream.first; // get init state

        bloc
          ..add(const CreateEvent())
          ..add(const SaveJustCreatedEvent(des));
        final state1 = (await bloc.stream.first) as MainState; // created
        expect(state1.todos, hasLength(1));

        final state2 = (await bloc.stream.first) as MainState; // saved
        expect(state2.todos, hasLength(1));

        final id = state2.todos.first.id!;
        bloc.add(DeleteEvent(id)); //  deleted
        final state3 = (await bloc.stream.first) as MainState;

        expect(state3.todos, hasLength(0)); // not showing to user

        final todoInDatabase = await local.getToDoById(id: id); // but still in database to delete online
        expect(todoInDatabase, isNotNull);
        expect(todoInDatabase?.isDeleted, isTrue);
      });
    });
  });
}

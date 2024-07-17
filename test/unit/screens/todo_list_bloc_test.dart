import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/repositories/todo_repository.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/todo_list_bloc.dart';

import '../../mocks/fake_local_database.dart';
import '../../mocks/fake_secure_storage.dart';
import '../../mocks/firebase_analytics.dart';
import '../../mocks/mock_online_database.dart';
import '../../mocks/mock_online_provider.dart';

void main() async {
  late MockOnlineDatabase database;
  late ToDoListBloc bloc;
  late MockOnlineProvider online;
  late FakeLocalDatabase local;
  late FakeSecureStorage storage;
  late DeviceIdProvider deviceIdProvider;
  late FirebaseAnalytics firebaseAnalytics;

  const createdToDoID = '1';
  const descriptionForCreatedToDo = 'Test description';
  late ToDo createdToDo;

  late MainState startState;
  late MainState justCreatedState;
  late MainState stateAfterSaved;
  group('TodoListBloc:', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseCoreMocks();
      await Firebase.initializeApp();
      firebaseAnalytics = MockFirebaseAnalytics();
      when(() => firebaseAnalytics.logEvent(name: any(named: 'name'))).thenAnswer((_) async {});
      registerFallbackValue(const ToDo.justCreated());
      registerFallbackValue(FakeCompanion());
    });
    setUp(() async {
      // Set up fresh copy of bloc
      database = MockOnlineDatabase();
      online = MockOnlineProvider(database);
      local = FakeLocalDatabase();
      storage = FakeSecureStorage();
      deviceIdProvider = await DeviceIdProvider.create(storage: storage);

      final todoRepository = ToDoRepository(
        localDatabase: local,
        onlineProvider: online,
        deviceIdProvider: deviceIdProvider,
        firebaseAnalytics: firebaseAnalytics,
      );

      bloc = ToDoListBloc(todoRepository);

      final time = DateTime(2024, 7, 10, 14, 23, 10);
      createdToDo = ToDo.justCreated(
        description: descriptionForCreatedToDo,
        createdAt: time,
        changedAt: time,
        id: createdToDoID,
        lastUpdatedBy: deviceIdProvider.deviceId,
      );
      startState = const MainState(
        todos: [],
        networkConnectionPresent: false,
        query: ToDoListQuery(),
        showDone: true,
      );
      stateAfterSaved = MainState(
        todos: [createdToDo],
        networkConnectionPresent: false,
        query: const ToDoListQuery(),
        showDone: true,
      );
      justCreatedState = const MainState(
        todos: [ToDo.justCreated()],
        networkConnectionPresent: false,
        query: ToDoListQuery(),
        showDone: true,
      );

      when(() => online.database.createToDo(any())).thenAnswer((_) async => createdToDo);
    });
    group('Internet is connected:', () {
      setUp(() async {
        // Provide default implementations for initialization
        when(online.database.getToDoList).thenAnswer((_) async => <ToDo>[]);
        when(() => online.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => <ToDo>[]);
      });

      blocTest<ToDoListBloc, ToDoListState>(
        'Get main state from online',
        build: () => bloc,
        expect: () => [startState.copyWith(networkConnectionPresent: true)],
      );

      blocTest<ToDoListBloc, ToDoListState>(
        'Create todo and get list for online',
        build: () => bloc,
        act: (bloc) {
          bloc
            ..add(const CreateEvent())
            ..add(const SaveJustCreatedEvent(descriptionForCreatedToDo))
            ..add(const LoadEvent());
        },
        expect: () {
          return [
            startState.copyWith(networkConnectionPresent: true),
            justCreatedState.copyWith(networkConnectionPresent: true),
            stateAfterSaved.copyWith(networkConnectionPresent: true),
            const LoadingState(),
            stateAfterSaved.copyWith(networkConnectionPresent: true),
          ];
        },
      );

      test('Delete todo and get list for online', () async {
        when(() => online.database.deleteToDo(any())).thenAnswer((_) async => createdToDo);

        await bloc.stream.first; // get init state

        bloc
          ..add(const CreateEvent())
          ..add(const SaveJustCreatedEvent(descriptionForCreatedToDo));
        final state1 = (await bloc.stream.first) as MainState; // created
        expect(state1.todos, hasLength(1));

        final state2 = (await bloc.stream.first) as MainState; // saved
        expect(state2.todos, hasLength(1));

        final id = state2.todos.first.id!;
        bloc.add(DeleteEvent(id)); //  deleted
        final state3 = (await bloc.stream.first) as MainState;

        expect(state3.todos, hasLength(0)); // not showing to user

        (await bloc.stream.first.timeout(const Duration(seconds: 5), onTimeout: () => bloc.state))
            as MainState; // after actual deletion
        final todoInDatabase = await local.getToDoById(id: id); // actually deleted from database as well from online
        expect(todoInDatabase, isNull);
      });

      test('Delete todo while internet becomes unavailable', () async {
        when(() => online.database.deleteToDo(any())).thenAnswer((_) async => null);

        await bloc.stream.first; // get init state

        bloc
          ..add(const CreateEvent())
          ..add(const SaveJustCreatedEvent(descriptionForCreatedToDo));
        final state1 = (await bloc.stream.first) as MainState; // created
        expect(state1.todos, hasLength(1));

        final state2 = (await bloc.stream.first) as MainState; // saved
        expect(state2.todos, hasLength(1));

        final id = state2.todos.first.id!;
        bloc.add(DeleteEvent(id)); //  deleted to user's eye
        final state3 = (await bloc.stream.first) as MainState;

        expect(state3.todos, hasLength(0)); // not showing to user
        expect(state3.networkConnectionPresent, isTrue);

        final todoInDatabase = await local.getToDoById(
          id: id,
          withDeleted: true,
        ); // marked as deleted from database but not from online -> show no connection
        expect(todoInDatabase, isNotNull);

        final state4 = (await bloc.stream.first) as MainState; // actually deleted
        expect(state4.networkConnectionPresent, isFalse);
      });
    });

    group('Internet not connected:', () {
      setUp(() async {
        // Provide default implementations for initialization
        when(online.database.getToDoList).thenAnswer((_) async => null);
        when(() => online.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => null);
      });

      blocTest<ToDoListBloc, ToDoListState>(
        'Get main state from local',
        build: () => bloc,
        expect: () => [startState],
      );

      blocTest<ToDoListBloc, ToDoListState>(
        'Create todo and get list for offline',
        build: () => bloc,
        act: (bloc) {
          bloc
            ..add(const CreateEvent())
            ..add(const SaveJustCreatedEvent(descriptionForCreatedToDo))
            ..add(const LoadEvent());
        },
        expect: () {
          return [
            startState,
            justCreatedState,
            stateAfterSaved,
            const LoadingState(),
            stateAfterSaved,
          ];
        },
      );

      test('Delete todo and get list for offline', () async {
        when(() => online.database.deleteToDo(any())).thenAnswer((_) async => null);

        await bloc.stream.first; // get init state

        bloc
          ..add(const CreateEvent())
          ..add(const SaveJustCreatedEvent(descriptionForCreatedToDo));
        final state1 = (await bloc.stream.first) as MainState; // created
        expect(state1.todos, hasLength(1));

        final state2 = (await bloc.stream.first) as MainState; // saved
        expect(state2.todos, hasLength(1));

        final id = state2.todos.first.id!;
        bloc.add(DeleteEvent(id)); //  deleted
        final state3 = (await bloc.stream.first) as MainState;

        expect(state3.todos, hasLength(0)); // not showing to user

        await pumpEventQueue();

        final todoInDatabase =
            await local.getToDoById(id: id, withDeleted: true); // but still in database to delete online
        expect(todoInDatabase, isNotNull);
        logger.d(todoInDatabase);
        expect(todoInDatabase?.isDeleted, isTrue);
      });
    });

    group('Internet agnostic tests', () {
      setUp(() async {
        // Provide default implementations for initialization
        when(online.database.getToDoList).thenAnswer((_) async => null);
        when(() => online.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => null);
      });

      blocTest<ToDoListBloc, ToDoListState>(
        'Toggle done',
        build: () => bloc,
        setUp: () {
          when(() => online.database.updateToDo(any())).thenAnswer((_) async => null);
        },
        act: (bloc) => bloc
          ..add(const CreateEvent())
          ..add(const SaveJustCreatedEvent(descriptionForCreatedToDo))
          ..add(const ToggleDoneEvent(createdToDoID))
          ..add(const ToggleDoneEvent(createdToDoID)),
        expect: () async {
          return [
            startState,
            justCreatedState,
            stateAfterSaved,
            stateAfterSaved.copyWith(todos: [createdToDo.copyWith(done: true)]),
            stateAfterSaved.copyWith(todos: [createdToDo.copyWith(done: false)]),
          ];
        },
      );

      blocTest<ToDoListBloc, ToDoListState>(
        'Toggle visibility',
        build: () => bloc,
        act: (bloc) => bloc
          ..add(const CreateEvent())
          ..add(const SaveJustCreatedEvent(descriptionForCreatedToDo))
          ..add(const ToggleVisibilityEvent())
          ..add(const ToggleVisibilityEvent()),
        expect: () {
          return [
            startState,
            justCreatedState,
            stateAfterSaved,
            stateAfterSaved.copyWith(showDone: false),
            stateAfterSaved,
          ];
        },
      );
    });
  });
}

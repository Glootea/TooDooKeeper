import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/repositories/todo_repository.dart';
import 'package:yandex_summer_school/core/entities/importance.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/extensions/local_database_todo_mapper_extension.dart';
import 'package:yandex_summer_school/screens/todo_edit/bloc/todo_edit_bloc.dart';

import '../../mocks/fake_local_database.dart';
import '../../mocks/fake_secure_storage.dart';
import '../../mocks/mock_online_database.dart';
import '../../mocks/mock_online_provider.dart';

void main() async {
  late MockOnlineDatabase database;
  late ToDoEditBloc bloc;
  late MockOnlineProvider online;
  late FakeLocalDatabase local;
  late FakeSecureStorage storage;
  late DeviceIdProvider deviceIdProvider;

  const createdToDoID = '1';
  const descriptionForCreatedToDo = 'Test description';
  late ToDo createdToDo;

  group('TodoEditBloc:', () {
    setUpAll(() {
      registerFallbackValue(const ToDo.justCreated());
      registerFallbackValue(FakeCompanion());
    });

    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();

      // Set up fresh copy of bloc
      database = MockOnlineDatabase();
      online = MockOnlineProvider(database);
      local = FakeLocalDatabase();
      storage = FakeSecureStorage();
      deviceIdProvider = await DeviceIdProvider.create(storage: storage);
      final toDoProvider = ToDoRepository(
        localDatabase: local,
        onlineProvider: online,
        deviceIdProvider: deviceIdProvider,
      );

      when(online.database.getToDoList).thenAnswer((_) async => null);
      when(() => online.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => null);

      bloc = ToDoEditBloc(todoProvider: toDoProvider, deviceIdProvider: deviceIdProvider);

      final time = DateTime(2024, 7, 10, 14, 23, 10);
      createdToDo = ToDo.justCreated(
        description: descriptionForCreatedToDo,
        createdAt: time,
        changedAt: time,
        id: createdToDoID,
        lastUpdatedBy: deviceIdProvider.deviceId,
      );
    });

    blocTest<ToDoEditBloc, ToDoEditState>(
      'Load by id',
      build: () => bloc,
      setUp: () async {
        when(() => online.database.getToDoById(any())).thenAnswer((_) async => null);
        await local.createToDo(companion: createdToDo.parseToDoItemCompanion);
      },
      act: (bloc) => bloc.add(const LoadByIdEvent(createdToDoID)),
      expect: () => [MainState(todo: createdToDo)],
    );

    final updatedToDo = ToDo.justCreated(
      description: '$descriptionForCreatedToDo!',
      deadline: DateTime(2025),
      importance: Importance.important,
    );

    blocTest<ToDoEditBloc, ToDoEditState>(
      'Load by id that does not exist',
      build: () => bloc,
      setUp: () async {
        when(() => online.database.getToDoById(any())).thenAnswer((_) async => null);
      },
      act: (bloc) => bloc.add(const LoadByIdEvent(createdToDoID)),
      expect: () => <ToDoEditState>[], // already contains empty todo
    );

    blocTest<ToDoEditBloc, ToDoEditState>(
      'Update todo',
      build: () => bloc,
      setUp: () async {
        when(() => online.database.getToDoById(any())).thenAnswer((_) async => null);
        await local.createToDo(companion: createdToDo.parseToDoItemCompanion);
      },
      act: (bloc) => bloc
        ..add(const LoadByIdEvent(createdToDoID))
        ..add(UpdateEvent(todo: updatedToDo))
        ..add(UpdateEvent(todo: createdToDo)),
      expect: () => [
        MainState(todo: createdToDo),
        MainState(todo: updatedToDo),
        MainState(todo: createdToDo),
      ],
    );

    blocTest<ToDoEditBloc, ToDoEditState>(
      'Save event',
      build: () => bloc,
      setUp: () => when(() async {
        when(() => online.database.getToDoById(any())).thenAnswer((_) async => null);
        when(() => online.database.updateToDo(any())).thenAnswer((_) async => null);
        await local.createToDo(companion: createdToDo.parseToDoItemCompanion);
      }),
      act: (bloc) => bloc
        ..add(const LoadByIdEvent(createdToDoID))
        ..add(const SaveEvent()),
      expect: () => [MainState(todo: createdToDo), const LoadingState(), const SavedState()],
    );

    blocTest<ToDoEditBloc, ToDoEditState>(
      'Delete event',
      build: () => bloc,
      setUp: () => when(() async {
        when(() => online.database.getToDoById(any())).thenAnswer((_) async => null);
        when(() => online.database.deleteToDo(any())).thenAnswer((_) async => null);
        await local.createToDo(companion: createdToDo.parseToDoItemCompanion);
      }),
      act: (bloc) => bloc
        ..add(const LoadByIdEvent(createdToDoID))
        ..add(const DeleteEvent()),
      expect: () => [
        MainState(todo: createdToDo),
        const SavedState(),
      ],
    );
  });
}

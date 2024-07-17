import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/data_sources/local_database/local_database.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/data/repositories/todo_repository.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/extensions/local_database_todo_mapper_extension.dart';

import '../../mocks/fake_local_database.dart';
import '../../mocks/fake_secure_storage.dart';
import '../../mocks/firebase_analytics.dart';
import '../../mocks/mock_online_database.dart';
import '../../mocks/mock_online_provider.dart';

void main() {
  group('Todo Repository:', () {
    late LocalDatabase local;
    late OnlineProvider online;
    late DeviceIdProvider deviceIdProvider;
    late FlutterSecureStorage storage;
    late FirebaseAnalytics firebaseAnalytics;

    late ToDoRepository todoRepository;

    final time = DateTime(2024, 7, 11, 8);

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupFirebaseCoreMocks();
      await Firebase.initializeApp();
      firebaseAnalytics = MockFirebaseAnalytics();
      when(() => firebaseAnalytics.logEvent(name: any(named: 'name'))).thenAnswer((_) async {});
    });

    setUp(() async {
      online = MockOnlineProvider(MockOnlineDatabase());
      local = FakeLocalDatabase();
      storage = FakeSecureStorage();

      deviceIdProvider = await DeviceIdProvider.create(storage: storage);

      todoRepository = ToDoRepository(
        localDatabase: local,
        onlineProvider: online,
        deviceIdProvider: deviceIdProvider,
        firebaseAnalytics: firebaseAnalytics,
      );
    });

    test('Merge lists', () async {
      await local.setFromOnline(
        [
          ToDo.justCreated(id: '1', description: 'local', createdAt: time, changedAt: time), // only local
          ToDo.justCreated(id: '2', description: 'local', createdAt: time, changedAt: time), // earlier
          ToDo.justCreated(id: '3', description: 'local', createdAt: time, changedAt: time), // later
        ].map((toDo) => toDo.parseToDoItemCompanion).toList(),
      );

      await local.createToDo(
        companion:
            ToDo.justCreated(id: '4', description: 'local', createdAt: time, changedAt: time).parseToDoItemCompanion,
      ); // marked deleted
      await local.deleteToDo(id: '4');

      when(() => online.database!.getToDoList()).thenAnswer(
        (_) async => <ToDo>[
          ToDo.justCreated(
            id: '2',
            description: 'online',
            createdAt: time.add(const Duration(minutes: 1)),
            changedAt: time.add(const Duration(minutes: 1)),
          ),
          ToDo.justCreated(
            id: '3',
            description: 'online',
            createdAt: time.subtract(const Duration(minutes: 1)),
            changedAt: time.subtract(const Duration(minutes: 1)),
          ),
          ToDo.justCreated(
            id: '5',
            description: 'online',
            createdAt: time,
            changedAt: time,
          ), // only online
        ],
      );

      var onlineResult = <ToDo>[];
      when(() => online.database!.updateToDoList(any()))
          .thenAnswer((i) async => onlineResult = i.positionalArguments.first as List<ToDo>);

      final expected = [
        ToDo.justCreated(id: '1', description: 'local', createdAt: time, changedAt: time),
        ToDo.justCreated(
          id: '2',
          description: 'online',
          createdAt: time.add(const Duration(minutes: 1)),
          changedAt: time.add(const Duration(minutes: 1)),
        ),
        ToDo.justCreated(id: '3', description: 'local', createdAt: time, changedAt: time),
        ToDo.justCreated(id: '5', description: 'online', createdAt: time, changedAt: time),
      ];
      final (actual, _) = await todoRepository.getToDoList();

      // local and online databases receive the same result
      expect(actual, expected);
      expect(onlineResult, expected);
    });

    test('Get todo (earlier local)', () async {
      final localToDo =
          ToDo.justCreated(id: '2', description: 'local', createdAt: time, changedAt: time).parseToDoItemCompanion;
      await local.setFromOnline([localToDo]);

      when(() => online.database!.getToDoById(any())).thenAnswer(
        (_) async => ToDo.justCreated(
          id: '2',
          description: 'online',
          createdAt: time.add(const Duration(minutes: 1)),
          changedAt: time.add(const Duration(minutes: 1)),
        ),
      );

      final expected = ToDo.justCreated(
        id: '2',
        description: 'online',
        createdAt: time.add(const Duration(minutes: 1)),
        changedAt: time.add(const Duration(minutes: 1)),
      );

      final (actual, _) = await todoRepository.getToDoById(id: '2');

      expect(actual, expected);
    });

    test('Get todo (later local)', () async {
      final localToDo =
          ToDo.justCreated(id: '3', description: 'local', createdAt: time, changedAt: time).parseToDoItemCompanion;
      await local.setFromOnline([localToDo]);

      when(() => online.database!.getToDoById(any())).thenAnswer(
        (_) async => ToDo.justCreated(
          id: '3',
          description: 'online',
          createdAt: time.subtract(const Duration(minutes: 1)),
          changedAt: time.subtract(const Duration(minutes: 1)),
        ),
      );

      final expected = ToDo.justCreated(id: '3', description: 'local', createdAt: time, changedAt: time);
      final (actual, _) = await todoRepository.getToDoById(id: '3');

      expect(actual, expected);
    });

    test('Get todo (exist online, but marked deleted locally later)', () async {
      final localToDo =
          ToDo.justCreated(id: '1', description: 'local', createdAt: time, changedAt: time).parseToDoItemCompanion;

      await local.setFromOnline([localToDo]);
      await local.markAsDeleted(todo: localToDo);

      when(() => online.database!.getToDoById(any())).thenAnswer(
        (_) async => ToDo.justCreated(
          id: '1',
          description: 'online',
          createdAt: time.subtract(const Duration(minutes: 1)),
          changedAt: time.subtract(const Duration(minutes: 1)),
        ),
      );

      const expected = null;
      final (actual, _) = await todoRepository.getToDoById(id: '1');

      expect(actual, expected);
    });

    test('Delete todo while connected to net', () async {
      final todo = ToDo.justCreated(id: '1', description: 'local', createdAt: time, changedAt: time);
      final localToDo = todo.parseToDoItemCompanion;

      await local.setFromOnline([localToDo]);

      when(() => online.database!.deleteToDo(any())).thenAnswer(
        (_) async => todo,
      );

      final (_, success) = await todoRepository.deleteTodo(todo: todo);
      expect(success, isTrue);

      final todoFromLocalDatabase = await local.getToDoById(id: todo.id!);
      expect(todoFromLocalDatabase, isNull);
    });

    test('Delete todo while disconnected to net', () async {
      final todo = ToDo.justCreated(id: '1', description: 'local', createdAt: time, changedAt: time);
      final localToDo = todo.parseToDoItemCompanion;

      await local.setFromOnline([localToDo]);

      when(() => online.database!.deleteToDo(any())).thenAnswer(
        (_) async => null,
      );

      final (_, success) = await todoRepository.deleteTodo(todo: todo);
      expect(success, isFalse);

      final todoFromLocalDatabase = await local.getToDoById(id: todo.id!);
      expect(todoFromLocalDatabase, isNull);
    });
  });
}

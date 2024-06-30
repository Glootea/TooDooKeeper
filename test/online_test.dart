import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/yandex_online_database.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

import 'secret.dart';

void main() {
  group('YandexOnlineDatabase test', () {
    test('create todo', () async {
      WidgetsFlutterBinding.ensureInitialized();
      final now = DateTime.now();
      final todo = ToDo(id: '13', description: 'blablabla', createdAt: now, changedAt: now, lastUpdatedBy: '23');
      logger.i(todo.toJson('1'));
      final database = await YandexOnlineDatabase.create(secret, MockStorage());
      final todos = await database.getToDoList();
      logger.i('list: $todos');
      final result = await database.createToDo(todo);
      logger.i('create: $result');
      final updateList = await database.updateToDoList([result!]);
      logger.i('updateList: $updateList');
      final byId = await database.getToDoById(result.id!);
      logger.i('Get by id: $byId');
      final update = await database.updateToDo(byId!);
      logger.i('update: $update');
      final delete = await database.deleteToDo(byId.id!);
      logger.i('delete: $delete');
    });
  });
}

class MockStorage extends FlutterSecureStorage {
  int revision = 0;
  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    if (key == 'revision') {
      logger.i(revision);
      return revision.toString();
    }
    return '0';
  }

  @override
  Future<void> write({
    required String key,
    required String? value,
    AndroidOptions? aOptions,
    IOSOptions? iOptions,
    LinuxOptions? lOptions,
  }) async {
    if (key == 'revision') {
      revision = int.parse(value!);
    }
  }
}

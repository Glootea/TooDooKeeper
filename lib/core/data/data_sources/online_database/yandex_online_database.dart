import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/online_database_abst.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

class YandexOnlineDatabase implements OnlineDatabase {
  YandexOnlineDatabase._(this._dio, this._secureStorage, this._revision);

  static Future<YandexOnlineDatabase> create(
    String authKey,
    FlutterSecureStorage secureStorage,
  ) async {
    final revision = int.parse(await secureStorage.read(key: _revisionKey) ?? '0');

    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://hive.mrdekk.ru/todo',
        headers: {
          'Authorization': 'OAuth $authKey',
        },
      ),
    );
    return YandexOnlineDatabase._(dio, secureStorage, revision);
  }

  final FlutterSecureStorage _secureStorage;
  final Dio _dio;
  int _revision;
  static const String _revisionKey = 'revision';

  Future<void> _updateRevision(int revision) async {
    _revision = revision;
    logger.i('Got revision: $_revision');
    return _secureStorage.write(key: _revisionKey, value: revision.toString());
  }

  Future<List<ToDo>> _parseList(Map<String, dynamic> data) async {
    final todos = (data['list'] as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    final revision = data['revision'] as int;
    await _updateRevision(revision);
    return todos.map<ToDo>(ToDo.fromJson).toList();
  }

  Future<ToDo> _parseElement(Map<String, dynamic> data) async {
    final todo = data['element'] as Map<String, dynamic>;
    final revision = data['revision'] as int;
    await _updateRevision(revision);
    return ToDo.fromJson(todo);
  }

  @override
  Future<List<ToDo>?> getToDoList() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/list');
      final data = response.data;
      if (data != null && data['status'] == 'ok') {
        logger.i('Received data for getToDoList');
        return _parseList(data);
      }
      throw Exception('Data has not been received for getToDoList');
    } catch (e) {
      logger.e('Failed to get to do list: $e');
      return null;
    }
  }

  @override
  Future<List<ToDo>?> updateToDoList(List<ToDo> todos) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        '/list',
        data: {'list': todos.map((e) => e.toJson()).toList()},
        options: Options(headers: {'X-Last-Known-Revision': _revision}),
      );
      final data = response.data;
      if (data != null && data['status'] == 'ok') {
        logger.i('Received data for updateToDoList');
        return _parseList(data);
      }
      throw Exception('Data has not been received for updateToDoList');
    } catch (e) {
      logger.e('Failed to update to do list: $e');
      return null;
    }
  }

  @override
  Future<ToDo?> getToDoById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/list/$id');
      final data = response.data;
      if (data != null && data['status'] == 'ok') {
        logger.i('Received data for getToDoById');
        return _parseElement(data);
      }
      throw Exception('Data has not been received for getToDoById');
    } catch (e) {
      logger.e('Failed to get to do by id: $e');
      return null;
    }
  }

  @override
  Future<ToDo?> createToDo(ToDo todo) async {
    try {
      final updatedToDo = todo.copyWith(
        createdAt: DateTime.now(),
        changedAt: DateTime.now(),
      );
      final todoJson = updatedToDo.toJson();
      final response = await _dio.post<Map<String, dynamic>>(
        '/list',
        data: {'element': todoJson},
        options: Options(headers: {'X-Last-Known-Revision': _revision}),
      );
      final data = response.data;
      if (data != null && data['status'] == 'ok') {
        logger.i('Received data for createToDo');
        return _parseElement(data);
      }
      throw Exception('Data has not been received for createToDo');
    } catch (e) {
      logger.e('Failed to create to do: $e');
      return null;
    }
  }

  @override
  Future<ToDo?> updateToDo(ToDo todo) async {
    try {
      final updatedToDo = todo.copyWith(changedAt: DateTime.now());
      final todoJson = updatedToDo.toJson();
      final response = await _dio.put<Map<String, dynamic>>(
        '/list/${todo.id}',
        data: {'element': todoJson},
        options: Options(headers: {'X-Last-Known-Revision': _revision}),
      );
      final data = response.data;
      if (data != null && data['status'] == 'ok') {
        logger.i('Received data for updateToDo');
        return _parseElement(data);
      }
      throw Exception('Data has not been received for updateToDo');
    } catch (e, s) {
      logger.e('Failed to update to do: $e, stackTrace: $s');
      return null;
    }
  }

  @override
  Future<ToDo?> deleteToDo(String id) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        '/list/$id',
        options: Options(headers: {'X-Last-Known-Revision': _revision}),
      );
      final data = response.data;
      if (data != null && data['status'] == 'ok') {
        logger.i('Received data for deleteToDo');
        return _parseElement(data);
      }
      throw Exception('Data has not been received for deleteToDo');
    } catch (e, s) {
      logger.e('Failed to delete to do: $e, stackTrace: $s');
      return null;
    }
  }

  @override
  Future<void> onLogout() => _secureStorage.deleteAll();
}

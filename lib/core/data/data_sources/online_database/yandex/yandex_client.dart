import 'package:dio/dio.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

class YandexOnlineClient {
  const YandexOnlineClient._(this._dio);
  factory YandexOnlineClient.create(String authKey) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://hive.mrdekk.ru/todo',
        headers: {
          'Authorization': 'OAuth $authKey',
        },
      ),
    );
    return YandexOnlineClient._(dio);
  }

  final Dio _dio;
  String get _listPath => '/list';
  String _todoIdPath(String id) => '$_listPath/$id';

  Future<(List<ToDo> todos, int revision)> _parseList(
    Map<String, dynamic> data,
  ) async {
    final todos = (data['list'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final revision = _getRevision(data);
    return (todos.map<ToDo>(ToDo.fromJson).toList(), revision);
  }

  Future<(ToDo todo, int revision)> _parseElement(
    Map<String, dynamic> data,
  ) async {
    final todo = data['element'] as Map<String, dynamic>;
    final revision = _getRevision(data);
    return (ToDo.fromJson(todo), revision);
  }

  Future<(List<ToDo> todos, int revision)?> getToDoList() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_listPath);
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

  Future<(List<ToDo> todos, int revision)?> updateToDoList(
    List<ToDo> todos,
    int revision,
  ) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        _listPath,
        data: {'list': todos.map((e) => e.toJson()).toList()},
        options: _getRevisionOptions(revision),
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

  Future<(ToDo todo, int revision)?> getToDoById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(_todoIdPath(id));
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

  Future<(ToDo todo, int revision)?> createToDo(ToDo todo, int revision) async {
    try {
      final todoJson = todo.toJson();
      logger.d(todoJson);
      final response = await _dio.post<Map<String, dynamic>>(
        _listPath,
        data: _getToDoData(todoJson),
        options: _getRevisionOptions(revision),
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

  Future<(ToDo todo, int revision)?> updateToDo(ToDo todo, int revision) async {
    try {
      final todoJson = todo.toJson();
      final id = todo.id;
      if (id == null) return null;
      final response = await _dio.put<Map<String, dynamic>>(
        _todoIdPath(id),
        data: _getToDoData(todoJson),
        options: _getRevisionOptions(revision),
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

  Future<(ToDo todo, int revision)?> deleteToDo(String id, int revision) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        _todoIdPath(id),
        options: _getRevisionOptions(revision),
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

  Options _getRevisionOptions(int revision) =>
      Options(headers: {'X-Last-Known-Revision': revision});

  Map<String, dynamic> _getToDoData(Map<String, dynamic> todoJson) =>
      {'element': todoJson};

  int _getRevision(Map<String, dynamic> data) => data['revision'] as int;
}

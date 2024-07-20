import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/online_database_abst.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/yandex/yandex_client.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

class YandexOnlineDatabase implements OnlineDatabase {
  YandexOnlineDatabase._({
    required FlutterSecureStorage secureStorage,
    required YandexOnlineClient client,
    required int revision,
  })  : _secureStorage = secureStorage,
        _client = client,
        _revision = revision;

  static Future<YandexOnlineDatabase> create(
    String authKey,
    FlutterSecureStorage secureStorage,
  ) async {
    final savedRevision = await secureStorage.read(key: _revisionToken);
    final revision = int.parse(savedRevision ?? '0');
    final client = YandexOnlineClient.create(authKey);

    return YandexOnlineDatabase._(
      client: client,
      secureStorage: secureStorage,
      revision: revision,
    );
  }

  final FlutterSecureStorage _secureStorage;
  final YandexOnlineClient _client;
  int _revision;
  static const String _revisionToken = 'revision';

  Future<void> _updateRevision(int revision) async {
    _revision = revision;
    logger.i('Got revision: $_revision');
    return _secureStorage.write(
      key: _revisionToken,
      value: revision.toString(),
    );
  }

  @override
  Future<List<ToDo>?> getToDoList() async {
    final result = await _client.getToDoList();
    return _handleToDoListResult(result);
  }

  @override
  Future<List<ToDo>?> updateToDoList(List<ToDo> todos) async {
    final result = await _client.updateToDoList(todos, _revision);
    return _handleToDoListResult(result);
  }

  Future<List<ToDo>?> _handleToDoListResult(
    (List<ToDo> todo, int revision)? result,
  ) async {
    if (result == null) return null;
    final (List<ToDo> receivedTodo, int revision) = result;
    await _updateRevision(revision);
    return receivedTodo;
  }

  @override
  Future<ToDo?> getToDoById(String id) async {
    final result = await _client.getToDoById(id);
    return _handleToDoResult(result);
  }

  @override
  Future<ToDo?> createToDo(ToDo todo) async {
    final result = await _client.createToDo(todo, _revision);
    return _handleToDoResult(result);
  }

  @override
  Future<ToDo?> updateToDo(ToDo todo) async {
    final result = await _client.updateToDo(todo, _revision);
    return _handleToDoResult(result);
  }

  @override
  Future<ToDo?> deleteToDo(String id) async {
    final result = await _client.deleteToDo(id, _revision);
    return _handleToDoResult(result);
  }

  Future<ToDo?> _handleToDoResult((ToDo todo, int revision)? result) async {
    if (result == null) return null;
    final (ToDo receivedTodo, int revision) = result;
    await _updateRevision(revision);
    return receivedTodo;
  }
}

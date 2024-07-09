import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_summer_school/core/logger.dart';

void main() {
  group('YandexOnlineDatabase test', () {
    test('create todo', () async {});
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

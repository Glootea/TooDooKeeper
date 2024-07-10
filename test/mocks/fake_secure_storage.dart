import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yandex_summer_school/core/logger.dart';

class FakeSecureStorage extends FlutterSecureStorage {
  int revision = 0;
  String deviceId = '123';
  static const String _revisionKey = 'revision';
  static const String _deviceIdKey = 'device_id';

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    if (key == _revisionKey) {
      logger.i(revision);
      return revision.toString();
    }
    if (key == _deviceIdKey) {
      return '123';
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
    if (key == _revisionKey) {
      revision = int.parse(value!);
    }
    if (key == _deviceIdKey) {
      deviceId = value!;
    }
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class DeviceIdProvider {
  DeviceIdProvider._({required String deviceId}) : _deviceId = deviceId;

  final String _deviceId;
  String get deviceId => _deviceId;

  static const String _key = 'device_id';

  static Future<DeviceIdProvider> create({
    FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    ),
  }) async {
    var id = await storage.read(key: _key);
    if (id == null) {
      id = const Uuid().v4();
      await storage.write(key: _key, value: id);
    }
    return DeviceIdProvider._(deviceId: id);
  }
}

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yandex_summer_school/core/data/data_sources/auth/auth_method_abst.dart';
import 'package:yandex_summer_school/main.dart';

class YandexAuth extends AuthMethod {
  YandexAuth._();
  YandexAuth._key(this.authToken);
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _keyString = 'auth-key';
  static const String _keyExpires = 'auth-expires';

  String? authToken;
  @override
  bool get isLoggedIn => authToken != null;

  static Future<YandexAuth> create() async {
    final expires = await _secureStorage.read(key: _keyExpires);
    if (expires != null && int.parse(expires) > DateTime.now().millisecondsSinceEpoch) {
      final authToken = await _secureStorage.read(key: _keyString);
      return YandexAuth._key(authToken);
    }
    return YandexAuth._();
  }

  @override
  Future<bool> login() async {
    if (authToken != null) return true;
    final savedKey = await _secureStorage.read(key: _keyString);
    final savedExpires = await _secureStorage.read(key: _keyExpires);
    if (savedKey != null && savedExpires != null) {
      if (int.parse(savedExpires) > DateTime.now().millisecondsSinceEpoch) {
        authToken = savedKey;
        return true;
      } else {
        await logout();
      }
    }
    const platform = MethodChannel('com.glootea.toodookeeper/todo');
    final data = await platform.invokeMethod<Map<Object?, Object?>>('yandexLogin');
    if (data == null) throw Exception('Failed to login user as no data was provided');
    logger.i(data);
    if (data['success'] as bool? ?? false) {
      final token = data['token'];
      final expiresIn = data['expiresIn'];
      if (token == null || expiresIn == null) throw Exception('Failed to login user as no data was provided');
      await _secureStorage.write(key: _keyString, value: token as String);
      final expires = DateTime.now().add(Duration(minutes: expiresIn as int));
      await _secureStorage.write(key: _keyExpires, value: expires.millisecondsSinceEpoch.toString());
      authToken = token;
      return true;
    }
    if (data['cancelled'] as bool? ?? false) {
      logger.w('User cancelled login');
      return false;
    }
    logger.e(data['error']);
    return false;
  }

  @override
  Future<void> logout() async {
    authToken = null;
    await Future.wait([_secureStorage.delete(key: _keyString), _secureStorage.delete(key: _keyExpires)]);
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yandex_summer_school/core/data/data_sources/auth/auth_method_abst.dart';
import 'package:yandex_summer_school/core/data/data_sources/auth/yandex/yandex_native_auth.dart';
import 'package:yandex_summer_school/core/logger.dart';

class YandexAuth extends AuthMethod {
  YandexAuth._(this._secureStorage);
  YandexAuth._key(this._secureStorage, this.authToken);

  final FlutterSecureStorage _secureStorage;
  static const String _keyToken = 'auth-key';
  static const String _keyExpiresToken = 'auth-expires';

  String? authToken;
  @override
  bool get isLoggedIn => authToken != null;

  static Future<YandexAuth> create(FlutterSecureStorage secureStorage) async {
    final expires = await secureStorage.read(key: _keyExpiresToken);
    if (expires != null &&
        int.parse(expires) > DateTime.now().millisecondsSinceEpoch) {
      final authToken = await secureStorage.read(key: _keyToken);
      return YandexAuth._key(secureStorage, authToken);
    }
    return YandexAuth._(secureStorage);
  }

  @override
  Future<bool> login() async {
    if (authToken != null) return true;
    final savedKey = await _secureStorage.read(key: _keyToken);
    final savedExpires = await _secureStorage.read(key: _keyExpiresToken);
    if (savedKey != null && savedExpires != null) {
      if (!_keyExpired(savedExpires)) {
        authToken = savedKey;
        return true;
      }
      await logout();
    }
    final data = await YandexNativeAuth.auth();
    if (data == null) {
      throw Exception('Failed to login user as no data was provided');
    }
    logger.i(data);
    if (data['success'] as bool? ?? false) {
      authToken = await _storeToken(data);
      return true;
    }
    if (data['cancelled'] as bool? ?? false) {
      logger.w('User cancelled login');
      return false;
    }
    logger.e(data['error']);
    return false;
  }

  bool _keyExpired(String expiresString) {
    final expires = int.tryParse(expiresString);
    if (expires == null) return true;
    return expires > DateTime.now().millisecondsSinceEpoch;
  }

  Future<String> _storeToken(Map<Object?, Object?> data) async {
    final token = data['token'];
    final expiresIn = data['expiresIn'];
    if (token == null || expiresIn == null) {
      throw Exception('Failed to login user as no data was provided');
    }
    await _secureStorage.write(
      key: _keyToken,
      value: token as String,
    );

    final expires = DateTime.now().add(Duration(minutes: expiresIn as int));
    await _secureStorage.write(
        key: _keyExpiresToken,
        value: expires.millisecondsSinceEpoch.toString());
    return token;
  }

  @override
  Future<void> logout() async {
    authToken = null;
    await _secureStorage.deleteAll();
  }
}

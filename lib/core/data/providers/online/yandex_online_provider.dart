import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yandex_summer_school/core/data/data_sources/auth/yandex/yandex_auth.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/yandex/yandex_online_database.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';

class YandexOnlineProvider extends OnlineProvider {
  YandexOnlineProvider._({
    required super.auth,
    required FlutterSecureStorage secureStorage,
    super.database,
  }) : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  static Future<YandexOnlineProvider> create(
    DeviceIdProvider deviceIdProvider,
    FlutterSecureStorage secureStorage,
  ) async {
    final auth = await YandexAuth.create(secureStorage);
    if (auth.isLoggedIn) {
      final configuredDatabase = await YandexOnlineDatabase.create(
        auth.authToken!,
        secureStorage,
      );
      return YandexOnlineProvider._(
        auth: auth,
        database: configuredDatabase,
        secureStorage: secureStorage,
      );
    }
    return YandexOnlineProvider._(auth: auth, secureStorage: secureStorage);
  }

  @override
  Future<bool> login() async {
    final result = await auth.login();
    if (result) {
      final configuredDatabase = await YandexOnlineDatabase.create(
        (auth as YandexAuth).authToken!,
        _secureStorage,
      );
      database = configuredDatabase;
      return true;
    }
    return false;
  }

  @override
  Future<void> logout() async {
    await auth.logout();
  }
}

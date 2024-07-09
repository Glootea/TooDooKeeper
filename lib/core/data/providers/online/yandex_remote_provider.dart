import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yandex_summer_school/core/data/data_sources/auth/yandex_auth.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/yandex_online_database.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/online/remote_provider_abst.dart';

class YandexOnlineProvider extends RemoteProvider {
  YandexOnlineProvider._({required super.auth, super.database});

  static Future<YandexOnlineProvider> create(DeviceIdProvider deviceIdProvider) async {
    final auth = await YandexAuth.create();
    if (auth.isLoggedIn) {
      final configuredDatabase = await YandexOnlineDatabase.create(
        auth.authToken!,
        deviceIdProvider,
        const FlutterSecureStorage(),
      );
      return YandexOnlineProvider._(auth: auth, database: configuredDatabase);
    }
    return YandexOnlineProvider._(auth: auth);
  }

  @override
  Future<void> logout() async {
    await auth.logout();
    await database?.onLogout();
  }
}

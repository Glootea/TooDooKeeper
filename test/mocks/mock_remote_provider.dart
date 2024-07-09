import 'package:yandex_summer_school/core/data/data_sources/auth/auth_method_abst.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/online_database_abst.dart';
import 'package:yandex_summer_school/core/data/providers/online/remote_provider_abst.dart';

class MockRemoteProvider implements RemoteProvider {
  MockRemoteProvider(this.database);

  @override
  final RemoteDatabase database;

  @override
  // TODO: implement auth
  AuthMethod get auth => throw UnimplementedError();

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

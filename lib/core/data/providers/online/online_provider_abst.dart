import 'package:yandex_summer_school/core/data/data_sources/auth/auth_method_abst.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/online_database_abst.dart';

abstract class OnlineProvider {
  OnlineProvider({required this.auth, required this.database});

  final AuthMethod auth;
  OnlineDatabase? database;
  Future<bool> login();
  Future<void> logout();
}

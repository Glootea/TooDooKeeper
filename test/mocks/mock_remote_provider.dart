import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/online_database_abst.dart';
import 'package:yandex_summer_school/core/data/providers/online/remote_provider_abst.dart';

class MockRemoteProvider extends Mock implements RemoteProvider {
  MockRemoteProvider(this.database);

  @override
  final RemoteDatabase database;
}

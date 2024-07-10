import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/online_database_abst.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';

class MockOnlineProvider extends Mock implements OnlineProvider {
  MockOnlineProvider(this.database);

  @override
  final OnlineDatabase database;
}

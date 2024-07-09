import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/online_database_abst.dart';

class MockRemoteDatabase extends Mock implements RemoteDatabase {}

class FakeRemoteDatabase extends Fake implements RemoteDatabase {}

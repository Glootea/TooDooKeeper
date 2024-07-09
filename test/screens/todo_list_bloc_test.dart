import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yandex_summer_school/core/data/providers/todo_provider.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/screens/todo_list/bloc/todo_list_bloc.dart';

import '../mocks/fake_local_database.dart';
import '../mocks/mock_remote_database.dart';
import '../mocks/mock_remote_provider.dart';

void main() async {
  MockRemoteDatabase? database;
  ToDoListBloc? bloc;
  MockRemoteProvider? remote;

  group('TodoListBloc', () {
    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();

      database = MockRemoteDatabase();
      remote = MockRemoteProvider(database!);
      var local = FakeLocalDatabase();
      when(remote!.database.getToDoList).thenAnswer((_) async => <ToDo>[]);
      when(() => remote!.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => <ToDo>[]);
      var toDoProvider = ToDoProvider(
        localDatabase: local,
        onlineProvider: remote!,
      );
      local = FakeLocalDatabase();
      toDoProvider = ToDoProvider(
        localDatabase: local,
        onlineProvider: remote!,
      );
      bloc = ToDoListBloc(toDoProvider);
    });
    test('Initial state is correct', () {
      expect(bloc!.state, const LoadingState());
    });
  });
}

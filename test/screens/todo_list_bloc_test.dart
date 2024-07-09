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

  group('TodoListBloc:', () {
    group('Internet is connected:', () {
      // Set up fresh copy of bloc
      setUp(() {
        WidgetsFlutterBinding.ensureInitialized();

        database = MockRemoteDatabase();
        remote = MockRemoteProvider(database!);
        final local = FakeLocalDatabase();

        // Provide default implementations for initialization
        when(remote!.database.getToDoList).thenAnswer((_) async => <ToDo>[]);
        when(() => remote!.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => <ToDo>[]);

        final toDoProvider = ToDoProvider(localDatabase: local, onlineProvider: remote!);
        bloc = ToDoListBloc(toDoProvider);
      });
      test('Initial state is correct', () {
        expect(bloc!.state, const LoadingState());
      });

      test('Get main state from online', () async {
        final state = await bloc?.stream.first;
        expect(state, const TypeMatcher<MainState>());
        if (state is MainState) {
          expect(state.todos, hasLength(0));
          expect(state.networkConnectionPresent, true);
          expect(state.query, const ToDoListQuery());
          expect(state.showDone, true);
        } else {
          throw TestFailure('Unexpected state: $state');
        }
      });
    });

    group('Internet not connected:', () {
      setUp(() {
        WidgetsFlutterBinding.ensureInitialized();

        database = MockRemoteDatabase();
        remote = MockRemoteProvider(database!);
        final local = FakeLocalDatabase();

        // Provide default implementations for initialization
        when(remote!.database.getToDoList).thenAnswer((_) async => null);
        when(() => remote!.database.updateToDoList(any<List<ToDo>>())).thenAnswer((_) async => null);

        final toDoProvider = ToDoProvider(localDatabase: local, onlineProvider: remote!);
        bloc = ToDoListBloc(toDoProvider);
      });

      test('Get main state from local', () async {
        final state = await bloc?.stream.first;
        expect(state, const TypeMatcher<MainState>());
        if (state is MainState) {
          expect(state.todos, hasLength(0));
          expect(state.networkConnectionPresent, false);
          expect(state.query, const ToDoListQuery());
          expect(state.showDone, true);
        } else {
          throw TestFailure('Unexpected state: $state');
        }
      });
    });
  });
}

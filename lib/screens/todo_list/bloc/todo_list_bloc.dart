import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/data/repositories/todo_repository.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

part 'todo_list_states.dart';
part 'todo_list_events.dart';
part 'todo_list_query.dart';
part 'todo_list_bloc.freezed.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc(this.todoProvider) : super(const ToDoListState.loading()) {
    on<ToDoListEvent>(
      (event, emit) {
        logger.d(event);
        return event.map<Future<void>>(
          load: (event) async => _onLoadEvent(event, emit),
          delete: (event) => _onDeleteEvent(event, emit),
          toggleDone: (event) => _onToggleDone(event, emit),
          logout: (event) => _onLogoutEvent(event, emit),
          create: (event) => _onCreateEvent(event, emit),
          saveJustCreated: (event) => _onSaveEvent(event, emit),
          toggleVisibility: (event) async => _onToggleVisibility(event, emit),
        );
      },
      transformer: sequential(),
    );

    add(const LoadEvent());
  }

  final ToDoRepository todoProvider;

  Future<void> _onLoadEvent(LoadEvent event, Emitter<ToDoListState> emit) async {
    try {
      emit(const LoadingState());
      final (todos, networkConnectionPresent) = await todoProvider.getToDoList();
      emit(
        ToDoListState(
          todos: todos,
          networkConnectionPresent: networkConnectionPresent,
          query: const ToDoListQuery(),
          showDone: true,
        ),
      );
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(ToDoListState.error(message: e.toString()));
    }
  }

  Future<void> _onDeleteEvent(DeleteEvent event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as MainState;
      final todo = currentState.todos.firstWhere((element) => element.id == event.id);
      final todos = currentState.todos.toList()..removeWhere((todo) => todo.id == event.id);

      emit(
        ToDoListState(
          todos: todos,
          networkConnectionPresent: currentState.networkConnectionPresent,
          query: currentState.query,
          showDone: currentState.showDone,
        ),
      );
      final (_, networkConnectionPresent) = await todoProvider.deleteTodo(todo: todo);
      if (currentState.networkConnectionPresent != networkConnectionPresent) {
        emit(
          ToDoListState(
            todos: todos,
            networkConnectionPresent: networkConnectionPresent,
            query: currentState.query,
            showDone: currentState.showDone,
          ),
        );
      }
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(ToDoListState.error(message: e.toString()));
    }
  }

  Future<void> _onToggleDone(ToggleDoneEvent event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as MainState;
      final todos = List<ToDo>.from(currentState.todos);
      final indexOfUpdateElement = todos.indexWhere((element) => element.id == event.id);
      final newValue = !todos[indexOfUpdateElement].done;
      logger.d(newValue);
      todos[indexOfUpdateElement] = todos[indexOfUpdateElement].copyWith(done: newValue);
      emit((state as MainState).copyWith(todos: todos.toList()));
      final (_, networkConnectionPresent) = await todoProvider.updateTodo(todo: todos[indexOfUpdateElement]);
      if (networkConnectionPresent != currentState.networkConnectionPresent) {
        emit((state as MainState).copyWith(networkConnectionPresent: networkConnectionPresent));
      }
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(ToDoListState.error(message: e.toString()));
    }
  }

  Future<void> _onLogoutEvent(LogoutEvent event, Emitter<ToDoListState> emit) async => todoProvider.logout();

  Future<void> _onCreateEvent(CreateEvent event, Emitter<ToDoListState> emit) async {
    const todo = ToDo.justCreated();
    final currentState = state as MainState;
    emit(
      MainState(
        todos: [...currentState.todos, todo],
        networkConnectionPresent: currentState.networkConnectionPresent,
        query: currentState.query,
        showDone: currentState.showDone,
      ),
    );
  }

  Future<void> _onSaveEvent(SaveJustCreatedEvent event, Emitter<ToDoListState> emit) async {
    final currentState = state as MainState;
    await todoProvider.createTodo(todo: ToDo.justCreated(description: event.description));
    final (todos, networkConnectionPresent) = await todoProvider.getToDoList();
    emit(
      MainState(
        todos: todos,
        networkConnectionPresent: networkConnectionPresent,
        query: currentState.query,
        showDone: currentState.showDone,
      ),
    );
  }

  void _onToggleVisibility(ToggleVisibilityEvent event, Emitter<ToDoListState> emit) {
    final currentState = state as MainState;
    emit(
      MainState(
        todos: currentState.todos,
        networkConnectionPresent: currentState.networkConnectionPresent,
        query: currentState.query,
        showDone: !currentState.showDone,
      ),
    );
  }
}

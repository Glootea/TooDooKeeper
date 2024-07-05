import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/data/providers/todo_provider.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/main.dart';
part 'todo_list_bloc.freezed.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc(this.todoProvider) : super(const ToDoListState.loading()) {
    on<ToDoListEvent>(
      (event, emit) async {
        logger.d(event);
        switch (event) {
          case LoadEvent():
            await _onLoadEvent(event, emit);
          case DeleteEvent():
            await _onDeleteEvent(event, emit);
          case ToggleDoneEvent():
            await _onToggleDone(event, emit);
          case LogoutEvent():
            await _onLogoutEvent(event, emit);
          case CreateEvent():
            await _onCreateEvent(event, emit);
          case SaveJustCreatedEvent():
            await _onSaveEvent(event, emit);
          case ToggleVisibilityEvent():
            _onToggleVisibility(event, emit);
        }
      },
      transformer: sequential(),
    );

    add(const LoadEvent());
  }

  final ToDoProvider todoProvider;

  Future<void> _onLoadEvent(LoadEvent event, Emitter<ToDoListState> emit) async {
    try {
      emit(const LoadingState());
      final todos = await todoProvider.getToDoList();
      emit(ToDoListState(todos: todos, query: const ToDoListQuery(), showDone: true));
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(ToDoListState.error(message: e.toString()));
    }
  }

  Future<void> _onDeleteEvent(DeleteEvent event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as MainState;
      final todos = currentState.todos.toList()..removeWhere((element) => element.id == event.id);
      emit(ToDoListState(todos: todos, query: currentState.query, showDone: currentState.showDone));
      await todoProvider.deleteTodo(id: event.id);
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(ToDoListState.error(message: e.toString()));
    }
  }

  Future<void> _onToggleDone(ToggleDoneEvent event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as MainState;
      final todos = currentState.todos.toList();
      final indexOfUpdateElement = todos.indexWhere((element) => element.id == event.id);
      final newValue = !todos[indexOfUpdateElement].done;
      logger.d(newValue);
      todos[indexOfUpdateElement] = todos[indexOfUpdateElement].copyWith(done: newValue);
      emit(ToDoListState(todos: todos, query: currentState.query, showDone: currentState.showDone));
      await todoProvider.createOrUpdateTodo(todo: todos[indexOfUpdateElement]);
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(ToDoListState.error(message: e.toString()));
    }
  }

  Future<void> _onLogoutEvent(LogoutEvent event, Emitter<ToDoListState> emit) async {
    await todoProvider.onlineProvider.logout();
  }

  Future<void> _onCreateEvent(CreateEvent event, Emitter<ToDoListState> emit) async {
    const todo = ToDo.justCreated();
    final currentState = state as MainState;
    emit(MainState(todos: [...currentState.todos, todo], query: currentState.query, showDone: currentState.showDone));
  }

  Future<void> _onSaveEvent(SaveJustCreatedEvent event, Emitter<ToDoListState> emit) async {
    final currentState = state as MainState;
    await todoProvider.createOrUpdateTodo(todo: ToDo.justCreated(description: event.description));
    final todos = await todoProvider.getToDoList();
    emit(MainState(todos: todos, query: currentState.query, showDone: currentState.showDone));
  }

  void _onToggleVisibility(ToggleVisibilityEvent event, Emitter<ToDoListState> emit) {
    final currentState = state as MainState;
    emit(MainState(todos: currentState.todos, query: currentState.query, showDone: !currentState.showDone));
  }
}

@Freezed(equal: false)
sealed class ToDoListState with _$ToDoListState {
  const factory ToDoListState({
    required List<ToDo> todos,
    required ToDoListQuery query,
    required bool showDone,
  }) = MainState;

  const factory ToDoListState.loading() = LoadingState;

  const factory ToDoListState.error({required String message}) = ErrorState;
}

@freezed
sealed class ToDoListEvent with _$ToDoListEvent {
  const factory ToDoListEvent.load() = LoadEvent;
  const factory ToDoListEvent.delete(String id) = DeleteEvent;
  const factory ToDoListEvent.toggleDone(String id) = ToggleDoneEvent;
  const factory ToDoListEvent.logout() = LogoutEvent;
  const factory ToDoListEvent.create() = CreateEvent;
  const factory ToDoListEvent.saveJustCreated(String description) = SaveJustCreatedEvent;
  const factory ToDoListEvent.toggleVisibility() = ToggleVisibilityEvent;
}

@freezed
sealed class ToDoListQuery with _$ToDoListQuery {
  const factory ToDoListQuery({
    String? search,
    List<SortOption>? sortOptions,
    List<FilterOption>? filterOptions,
  }) = _ToDoListQuery;
}

class SortOption {}

class FilterOption {}

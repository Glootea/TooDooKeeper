import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/data/providers/todo.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/main.dart';
part 'bloc.freezed.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc(this.todoProvider) : super(const ToDoListState.loading()) {
    on<ToDoListEvent>((event, emit) async {
      switch (event) {
        case LoadEvent():
          await _onLoadEvent(event, emit);
        case DeleteEvent():
          await _onDeleteEvent(event, emit);
        case ToggleDoneEvent():
          await _onMarkAsDoneEvent(event, emit);
        default:
          throw UnimplementedError('Unknown event at ToDoListBloc: ${event.runtimeType}');
      }
    });

    add(const LoadEvent());
  }

  final ToDoProvider todoProvider;

  Future<void> _onLoadEvent(LoadEvent event, Emitter<ToDoListState> emit) async {
    try {
      final todos = await todoProvider.getToDoList();
      emit(ToDoListState(todos: todos, query: const ToDoListQuery()));
    } on Exception catch (e, s) {
      // TODO: handle properly
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(const ToDoListState.error());
    }
  }

  Future<void> _onDeleteEvent(DeleteEvent event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as MainState;
      final todos = currentState.todos.toList()..removeWhere((element) => element.id == event.id);
      emit(ToDoListState(todos: todos, query: currentState.query));
      await todoProvider.deleteTodo(id: event.id);
    } on Exception catch (e, s) {
      // TODO: handle properly
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(const ToDoListState.error());
    }
  }

  Future<void> _onMarkAsDoneEvent(ToggleDoneEvent event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as MainState;
      final todos = currentState.todos.toList();
      final indexOfUpdateElement = todos.indexWhere((element) => element.id == event.id);
      final newValue = !todos[indexOfUpdateElement].done;
      todos[indexOfUpdateElement] = todos[indexOfUpdateElement].copyWith(done: newValue);
      emit(ToDoListState(todos: todos, query: currentState.query));
      await todoProvider.updateTodo(todo: todos[indexOfUpdateElement]);
    } on Exception catch (e, s) {
      // TODO: handle properly
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(const ToDoListState.error());
    }
  }
}

@freezed
sealed class ToDoListState with _$ToDoListState {
  const factory ToDoListState({
    required List<ToDo> todos,
    required ToDoListQuery query,
  }) = MainState;

  const factory ToDoListState.loading() = LoadingState;

  const factory ToDoListState.error() = ErrorState;
}

@freezed
sealed class ToDoListEvent with _$ToDoListEvent {
  const factory ToDoListEvent.load() = LoadEvent;
  const factory ToDoListEvent.delete(int id) = DeleteEvent;
  const factory ToDoListEvent.toggleDone(int id) = ToggleDoneEvent;
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

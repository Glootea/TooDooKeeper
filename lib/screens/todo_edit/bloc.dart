import 'package:drift/isolate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/data/providers/todo.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/main.dart';
part 'bloc.freezed.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  ToDoListBloc(this.todoProvider) : super(const ToDoListState.loading()) {
    on<ToDoListEvent>((event, emit) {
      switch (event.runtimeType) {
        case _Load:
          _onLoadEvent(event as _Load, emit);
        case _Delete:
          _onDeleteEvent(event as _Delete, emit);
        case _ToggleDone:
          _onMarkAsDoneEvent(event as _ToggleDone, emit);
      }
    });
  }

  final ToDoProvider todoProvider;

  Future<void> _onLoadEvent(_Load event, Emitter<ToDoListState> emit) async {
    try {
      final todos = await todoProvider.getToDoList();
      emit(ToDoListState(todos: todos));
    } on DriftRemoteException catch (e, s) {
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(const ToDoListState.error());
    }
  }

  Future<void> _onDeleteEvent(_Delete event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as _ToDoListState;
      final todos = currentState.todos.toList()..removeWhere((element) => element.id == event.id);
      emit(ToDoListState(todos: todos));
      await todoProvider.deleteTodo(id: event.id);
    } on DriftRemoteException catch (e, s) {
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(const ToDoListState.error());
    }
  }

  Future<void> _onMarkAsDoneEvent(_ToggleDone event, Emitter<ToDoListState> emit) async {
    try {
      final currentState = state as _ToDoListState;
      final todos = currentState.todos.toList();
      final indexOfUpdateElement = todos.indexWhere((element) => element.id == event.id);
      final newValue = !todos[indexOfUpdateElement].done;
      todos[indexOfUpdateElement] = todos[indexOfUpdateElement].copyWith(done: newValue);
      emit(ToDoListState(todos: todos));
      await todoProvider.updateTodo(todo: todos[indexOfUpdateElement]);
    } on DriftRemoteException catch (e, s) {
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(const ToDoListState.error());
    }
  }
}

@freezed
class ToDoListState with _$ToDoListState {
  const factory ToDoListState({required List<ToDo> todos}) = _ToDoListState;

  const factory ToDoListState.loading() = _Loading;

  const factory ToDoListState.error() = _Error;
}

@freezed
class ToDoListEvent with _$ToDoListEvent {
  const factory ToDoListEvent.load() = _Load;
  const factory ToDoListEvent.delete(int id) = _Delete;
  const factory ToDoListEvent.toggleDone(int id) = _ToggleDone;
}

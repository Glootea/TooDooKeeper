import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/data/providers/todo.dart';
import 'package:yandex_summer_school/domain/todo.dart';
import 'package:yandex_summer_school/main.dart';
part 'bloc.freezed.dart';

class ToDoEditBloc extends Bloc<ToDoEditEvent, ToDoEditState> {
  ToDoEditBloc({
    required this.todoProvider,
    this.id,
    this.data,
  }) : super(const ToDoEditState.loading()) {
    on<ToDoEditEvent>((event, emit) async {
      switch (event) {
        case LoadEvent():
          await _onLoadEvent(event, emit);
        case SaveEvent():
          await _onSaveEvent(event, emit);
        case UpdateEvent():
          await _onUpdateEvent(event, emit);
      }
    });
  }

  Future<void> _onLoadEvent(LoadEvent event, Emitter<ToDoEditState> emit) async {
    final todo = await todoProvider.getToDoById(id: event.id);
    if (todo == null) {
      emit(const ToDoEditState.error());
    } else {
      emit(ToDoEditState(todo: todo));
    }
  }

  Future<void> _onSaveEvent(SaveEvent event, Emitter<ToDoEditState> emit) async {
    try {
      final todo = (state as MainState).todo;
      final data = todo.data;
      emit(SaveState(data: data));
    } on Exception catch (e, s) {
      // TODO: handle properly
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(const ToDoEditState.error());
    }
  }

  Future<void> _onUpdateEvent(UpdateEvent event, Emitter<ToDoEditState> emit) async {
    emit(MainState(todo: event.todo));
    return todoProvider.updateTodo(todo: event.todo);
  }

  final ToDoProvider todoProvider;
  final int? id;
  final String? data;
}

@freezed
sealed class ToDoEditEvent with _$ToDoEditEvent {
  const factory ToDoEditEvent.load(int id) = LoadEvent;
  const factory ToDoEditEvent.save() = SaveEvent;
  const factory ToDoEditEvent.update({required ToDo todo}) = UpdateEvent;
}

@freezed
sealed class ToDoEditState with _$ToDoEditState {
  const factory ToDoEditState({required ToDo todo}) = MainState;
  const factory ToDoEditState.loading() = LoadingState;
  const factory ToDoEditState.error() = ErrorState;
  const factory ToDoEditState.save({required String data}) = SaveState;
}

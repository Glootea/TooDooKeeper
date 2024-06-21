import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/common/data/providers/todo.dart';
import 'package:yandex_summer_school/common/entities/todo.dart';
import 'package:yandex_summer_school/main.dart';

part 'bloc.freezed.dart';

class ToDoEditBloc extends Bloc<ToDoEditEvent, ToDoEditState> {
  ToDoEditBloc({
    required this.todoProvider,
    this.passedId,
    this.data,
  }) : super(const ToDoEditState.loading()) {
    logger.d('create ToDoEditBloc');
    // on<>
    on<ToDoEditEvent>(
      (event, emit) async {
        logger.d(event);
        switch (event) {
          case LoadByIdEvent():
            await _onLoadByIdEvent(event, emit);
          case ParseDataFromLinkEvent():
            await _onParseDataFromLinkEvent(event, emit);
          case SaveEvent():
            await _onSaveEvent(event, emit);
          case UpdateEvent():
            await _onUpdateEvent(event, emit);
          case CreateEvent():
            await _onCreateEvent(event, emit);
        }
      },
    );
    logger.d(passedId);

    if (passedId != null) {
      add(LoadByIdEvent(passedId!));
    } else if (data != null) {
      logger.d('data');
      add(ParseDataFromLinkEvent(data: data!));
    } else {
      logger.d('none');
      add(const ToDoEditEvent.create());
    }
  }

  Future<void> _onLoadByIdEvent(LoadByIdEvent event, Emitter<ToDoEditState> emit) async {
    final todo = await todoProvider.getToDoById(id: event.id);
    logger.d('Loaded TODO: $todo');
    if (todo == null) {
      emit(const ToDoEditState.error('ToDo не найден'));
    } else {
      emit(ToDoEditState(todo: todo));
    }
  }

  Future<void> _onSaveEvent(SaveEvent event, Emitter<ToDoEditState> emit) async {
    try {
      final todo = (state as MainState).todo;
      await todoProvider.createOrUpdateTodo(todo: todo);
    } on Exception catch (e, s) {
      // TODO: handle properly
      if (kDebugMode) {
        logger.e(e, stackTrace: s);
      }
      emit(ToDoEditState.error(e.toString()));
    }
  }

  Future<void> _onUpdateEvent(UpdateEvent event, Emitter<ToDoEditState> emit) async {
    emit(MainState(todo: event.todo));
  }

  Future<void> _onParseDataFromLinkEvent(ParseDataFromLinkEvent event, Emitter<ToDoEditState> emit) async {
    add(const ToDoEditEvent.create());
    // emit(const MainState(todo: ToDo.empty())); // TODO: parse data to todo
  }

  Future<void> _onCreateEvent(CreateEvent event, Emitter<ToDoEditState> emit) async {
    const todo = ToDo.justCreated();
    emit(const MainState(todo: todo));
  }

  final ToDoProvider todoProvider;
  final int? passedId;
  final String? data;
}

@freezed
sealed class ToDoEditEvent with _$ToDoEditEvent {
  const ToDoEditEvent._();
  const factory ToDoEditEvent.load(int id) = LoadByIdEvent;
  const factory ToDoEditEvent.save() = SaveEvent;
  const factory ToDoEditEvent.update({required ToDo todo}) = UpdateEvent;
  const factory ToDoEditEvent.parseData({required String data}) = ParseDataFromLinkEvent;
  const factory ToDoEditEvent.create() = CreateEvent;
}

@freezed
sealed class ToDoEditState with _$ToDoEditState {
  const factory ToDoEditState({required ToDo todo}) = MainState;
  const factory ToDoEditState.loading() = LoadingState;
  const factory ToDoEditState.error(String error) = ErrorState;
  const factory ToDoEditState.save() = SaveState;
}

import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/data/providers/device_id_provider.dart';
import 'package:yandex_summer_school/core/data/providers/share_provider.dart';
import 'package:yandex_summer_school/core/data/repositories/todo_repository.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

part 'todo_edit_bloc.freezed.dart';
part 'todo_edit_events.dart';
part 'todo_edit_states.dart';

class ToDoEditBloc extends Bloc<ToDoEditEvent, ToDoEditState> {
  ToDoEditBloc({
    required ToDoRepository todoRepository,
    required DeviceIdProvider deviceIdProvider,
    required ShareProvider shareProvider,
    String? passedId,
    String? data,
  })  : _data = data,
        _passedId = passedId,
        _todoRepository = todoRepository,
        _deviceIdProvider = deviceIdProvider,
        _shareProvider = shareProvider,
        super(const LoadingState()) {
    on<ToDoEditEvent>(
      (event, emit) {
        return event.map<Future<void>>(
          load: (event) => _onLoadByIdEvent(event, emit),
          save: (event) => _onSaveEvent(event, emit),
          update: (event) => _onUpdateEvent(event, emit),
          parseData: (event) => _onParseDataFromLinkEvent(event, emit),
          create: (event) => _onCreateEvent(event, emit),
          shareExport: (event) => _onShareExportEvent(event, emit),
          shareCopy: (event) => _onShareCopyEvent(event, emit),
          delete: (event) => _onDeleteEvent(event, emit),
        );
      },
      transformer: sequential(),
    );

    _addInitialEvent();
  }

  final ToDoRepository _todoRepository;
  final String? _passedId;
  final String? _data;
  final DeviceIdProvider _deviceIdProvider;
  final ShareProvider _shareProvider;

  void _addInitialEvent() {
    if (_passedId != null) {
      add(LoadByIdEvent(id: _passedId));
    } else if (_data != null) {
      add(ParseDataFromLinkEvent(data: _data));
    } else {
      add(const ToDoEditEvent.create());
    }
  }

  Future<void> _onLoadByIdEvent(
    LoadByIdEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    final (todo, _) = await _todoRepository.getToDoById(id: event.id);
    logger.d('Loaded TODO: $todo');
    if (todo == null) {
      emit(const MainState(todo: ToDo.justCreated()));
    } else {
      emit(MainState(todo: todo));
    }
  }

  Future<void> _onSaveEvent(
    SaveEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    try {
      final todo = (state as MainState).todo;
      emit(const LoadingState());
      if (todo.justCreated) {
        await _todoRepository.createTodo(todo: todo);
      } else {
        await _todoRepository.updateTodo(todo: todo);
      }
      emit(const SavedState());
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(const ToDoEditState.error());
    }
  }

  Future<void> _onUpdateEvent(
    UpdateEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    emit(MainState(todo: event.todo));
    logger.d('TODO updated: ${event.todo}');
  }

  Future<void> _onParseDataFromLinkEvent(
    ParseDataFromLinkEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    try {
      final data = _shareProvider.getSharedData(event.data);
      final todo = ToDo.justCreatedFromJson(data);
      emit(MainState(todo: todo));
    } on Exception catch (e, s) {
      logger.e('Failed to parse data from link: $e', stackTrace: s);
      emit(const MainState(todo: ToDo.justCreated()));
    }
  }

  Future<void> _onCreateEvent(
    CreateEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    const todo = ToDo.justCreated();
    emit(const MainState(todo: todo));
  }

  Future<void> _onShareExportEvent(
    ShareExportEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    try {
      if (kIsWeb || !Platform.isAndroid) {
        emit(
          (state as MainState)
              .copyWith(message: ToDoEditMessage.unsupportedOnPlatform),
        );
        return;
      }
      final currentState = state as MainState;
      emit(currentState.copyWith(message: ToDoEditMessage.prepareShareLink));

      await _shareProvider.shareToDo(
        currentState.todo,
        _deviceIdProvider.deviceId,
      );
    } catch (e) {
      emit((state as MainState).copyWith(message: ToDoEditMessage.shareError));
      logger.e(e.toString(), stackTrace: StackTrace.current);
    }
  }

  Future<void> _onShareCopyEvent(
    ShareCopyEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    final currentState = state as MainState;
    emit(currentState.copyWith(message: ToDoEditMessage.prepareShareLink));

    final exportText = await _getToDoData(_deviceIdProvider.deviceId);

    emit(currentState.copyWith(message: ToDoEditMessage.copiedToDo));
    await Clipboard.setData(ClipboardData(text: exportText));
  }

  Future<String> _getToDoData(String deviceID) async {
    final toDo = (state as MainState).todo;
    late String text;
    text = toDo.dataToExport(deviceID);
    final exportText = await _shareProvider.getShareLink(text, tryShort: true);
    return exportText; // TODO: show guide for activating deep links in settings with 'don't show again' option
  }

  Future<void> _onDeleteEvent(
    DeleteEvent event,
    Emitter<ToDoEditState> emit,
  ) async {
    try {
      final todo = (state as MainState).todo;
      await _todoRepository.deleteTodo(todo: todo);
      emit(const SavedState());
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(const ToDoEditState.error());
    }
  }
}

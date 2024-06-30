import 'dart:io';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_summer_school/core/data/data_sources/obfuscation/gzip_obfuscation.dart';
import 'package:yandex_summer_school/core/data/data_sources/online_database/yandex_online_database.dart';
import 'package:yandex_summer_school/core/data/providers/share_provider.dart';
import 'package:yandex_summer_school/core/data/providers/todo_provider.dart';
import 'package:yandex_summer_school/core/entities/todo.dart';
import 'package:yandex_summer_school/core/logger.dart';

part 'todo_edit_events.dart';
part 'todo_edit_states.dart';
part 'todo_edit_bloc.freezed.dart';

class ToDoEditBloc extends Bloc<ToDoEditEvent, ToDoEditState> {
  ToDoEditBloc({
    required this.todoProvider,
    this.passedId,
    this.data,
  }) : super(const ToDoEditState.loading()) {
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

  final ToDoProvider todoProvider;
  final String? passedId;
  final String? data;

  void _addInitialEvent() {
    if (passedId != null) {
      add(LoadByIdEvent(passedId!));
    } else if (data != null) {
      add(ParseDataFromLinkEvent(data: data!));
    } else {
      add(const ToDoEditEvent.create());
    }
  }

  Future<void> _onLoadByIdEvent(LoadByIdEvent event, Emitter<ToDoEditState> emit) async {
    final todo = await todoProvider.getToDoById(id: event.id);
    logger.d('Loaded TODO: $todo');
    if (todo == null) {
      emit(const ToDoEditState.error());
    } else {
      emit(ToDoEditState(todo: todo));
    }
  }

  Future<void> _onSaveEvent(SaveEvent event, Emitter<ToDoEditState> emit) async {
    try {
      final todo = (state as MainState).todo;
      emit(const LoadingState());
      await todoProvider.createOrUpdateTodo(todo: todo);
      emit(const SavedState());
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(const ToDoEditState.error());
    }
  }

  Future<void> _onUpdateEvent(UpdateEvent event, Emitter<ToDoEditState> emit) async {
    emit(MainState(todo: event.todo));
  }

  Future<void> _onParseDataFromLinkEvent(ParseDataFromLinkEvent event, Emitter<ToDoEditState> emit) async {
    try {
      final shareProvider = ShareProvider(obfuscation: GZipObfuscation());
      final data = shareProvider.getSharedData(event.data);
      final todo = ToDo.justCreatedFromJson(data);
      emit(MainState(todo: todo));
    } on Exception catch (e, s) {
      logger.e('Failed to parse data from link: $e', stackTrace: s);
      emit(const MainState(todo: ToDo.justCreated()));
    }
  }

  Future<void> _onCreateEvent(CreateEvent event, Emitter<ToDoEditState> emit) async {
    const todo = ToDo.justCreated();
    emit(const MainState(todo: todo));
  }

  Future<void> _onShareExportEvent(ShareExportEvent event, Emitter<ToDoEditState> emit) async {
    try {
      if (kIsWeb || !Platform.isAndroid) {
        emit((state as MainState).copyWith(message: ToDoEditMessage.unsupportedOnPlatform));
        return;
      }
      final currentState = state as MainState;
      emit(currentState.copyWith(message: ToDoEditMessage.prepareShareLink));
      final exportText = await _getToDoData();
      const platform = MethodChannel('com.glootea.toodookeeper/todo');
      await platform.invokeMethod<void>('share', {'text': exportText});
    } catch (e) {
      emit((state as MainState).copyWith(message: ToDoEditMessage.shareError));
      logger.e(e.toString(), stackTrace: StackTrace.current);
    }
  }

  Future<void> _onShareCopyEvent(ShareCopyEvent event, Emitter<ToDoEditState> emit) async {
    final currentState = state as MainState;
    emit(currentState.copyWith(message: ToDoEditMessage.prepareShareLink));
    final exportText = await _getToDoData();
    emit(currentState.copyWith(message: ToDoEditMessage.copiedToDo));
    await Clipboard.setData(ClipboardData(text: exportText));
  }

  Future<String> _getToDoData() async {
    final toDo = (state as MainState).todo;
    late String text;

    final onlineProvider = todoProvider.onlineProvider.database;
    if (onlineProvider is YandexOnlineDatabase) {
      //TODO: refactor/hide realization
      text = toDo.dataToExport(onlineProvider.deviceId);
    } else {
      text = toDo.dataToExport('0');
    }

    final obfuscation = GZipObfuscation();
    final shareProvider = ShareProvider(obfuscation: obfuscation);
    final exportText = await shareProvider.getShareLink(text, tryShort: true);
    return exportText; // TODO: show guide for activating deep links in settings with 'don't show again' option
  }

  Future<void> _onDeleteEvent(DeleteEvent event, Emitter<ToDoEditState> emit) async {
    try {
      final id = (state as MainState).todo.id;
      if (id == null) throw Exception('ID is null, so it can not be deleted');
      await todoProvider.deleteTodo(id: id);
      emit(const SavedState());
    } on Exception catch (e, s) {
      logger.e(e, stackTrace: s);
      emit(const ToDoEditState.error());
    }
  }
}

part of 'todo_edit_bloc.dart';

@freezed
sealed class ToDoEditEvent with _$ToDoEditEvent {
  const ToDoEditEvent._();
  const factory ToDoEditEvent.load(String id) = LoadByIdEvent;
  const factory ToDoEditEvent.save() = SaveEvent;
  const factory ToDoEditEvent.update({required ToDo todo}) = UpdateEvent;
  const factory ToDoEditEvent.parseData({required String data}) =
      ParseDataFromLinkEvent;
  const factory ToDoEditEvent.create() = CreateEvent;
  const factory ToDoEditEvent.shareExport() = ShareExportEvent;
  const factory ToDoEditEvent.shareCopy() = ShareCopyEvent;
  const factory ToDoEditEvent.delete() = DeleteEvent;
}

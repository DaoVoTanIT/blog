import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/task/task_model.dart';

abstract class FileEvent extends Equatable {
  const FileEvent();

  @override
  List<Object> get props => [];
}

class DeleteFileEvent extends FileEvent {
  const DeleteFileEvent({
    required this.idFile,
  });
  final String idFile;
  @override
  List<Object> get props => [];
}

class UploadFileEvent extends FileEvent {
  const UploadFileEvent({
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  List<Object> get props => [taskModel];
}

class DownloadFileEvent extends FileEvent {
  const DownloadFileEvent({
    required this.id,
  });
  final String id;
  @override
  List<Object> get props => [id];
}

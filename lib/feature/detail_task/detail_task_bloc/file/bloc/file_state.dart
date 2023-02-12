import 'package:equatable/equatable.dart';

abstract class FileState extends Equatable {
  //const FileState(this.listCheckListModel);
//  final List<FileUploadModel> listCheckListModel;

  @override
  List<Object> get props => [];
}

class FileInitial extends FileState {
  // const FileInitial(super.listCheckListModel);
}

class FileLoading extends FileState {
  //const FileLoading(super.listCheckListModel);
}

class FileSucsses extends FileState {
// const FileSucsses(super.listCheckListModel);
}

class FileError extends FileState {
  FileError({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}

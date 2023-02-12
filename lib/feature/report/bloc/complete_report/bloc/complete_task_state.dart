import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/task/task_model.dart';

abstract class CompleteTaskState extends Equatable {
  const CompleteTaskState(this.listReportCompleteModel);
  final List<TaskModel> listReportCompleteModel;

  @override
  List<Object> get props => [];
}

class CompleteTaskInitial extends CompleteTaskState {
  const CompleteTaskInitial(super.listReportCompleteModel);
}

class CompleteTaskLoading extends CompleteTaskState {
  const CompleteTaskLoading(super.listReportCompleteModel);
}

class CompleteTaskSuccess extends CompleteTaskState {
  const CompleteTaskSuccess(super.listReportCompleteModel);
}

class CompleteTaskError extends CompleteTaskState {
  CompleteTaskError({this.error}) : super([]);
  final String? error;
  @override
  List<Object> get props => [error!];
}

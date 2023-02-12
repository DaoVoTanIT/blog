import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/checklist/check_list.dart';

abstract class ChecklistState extends Equatable {
  const ChecklistState(this.listCheckListModel);
  final List<CheckListModel> listCheckListModel;

  @override
  List<Object> get props => [];
}

class ChecklistInitial extends ChecklistState {
  const ChecklistInitial(super.listCheckListModel);
}

class ChecklistLoading extends ChecklistState {
  const ChecklistLoading(super.listCheckListModel);
}

class ChecklistLoaded extends ChecklistState {
  const ChecklistLoaded(super.listCheckListModel);
}

class ChecklistSuccess extends ChecklistState {
  const ChecklistSuccess(super.listCheckListModel);
}

class CreateChecklistSuccess extends ChecklistState {
  const CreateChecklistSuccess(super.listCheckListModel);
}

class ChecklistError extends ChecklistState {
  ChecklistError({this.error}) : super([]);
  final String? error;
  @override
  List<Object> get props => [error!];
}

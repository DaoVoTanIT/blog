import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/checklist/check_list.dart';

abstract class ChecklistEvent extends Equatable {
  const ChecklistEvent();
}

class GetChecklistEvent extends ChecklistEvent {
  const GetChecklistEvent({required this.id});
  final String id;
  @override
  List<Object> get props => [];
}

class ChecklistsEvent extends ChecklistEvent {
  const ChecklistsEvent({required this.idChecklist});
  final String idChecklist;
  @override
  List<Object> get props => [idChecklist];
}

class CreateCheckListEvent extends ChecklistEvent {
  const CreateCheckListEvent({required this.model});
  final CheckListModel model;
  @override
  List<Object> get props => [];
}

import 'package:cmms/common/model/task/task_model.dart';

class MilestoneModel {
  MilestoneModel({
    this.numTask,
    this.milestoneName,
    required this.listTask,
  });

  int? numTask;
  String? milestoneName;
  List<TaskModel> listTask;

  factory MilestoneModel.fromJson(Map<String, dynamic> json) => MilestoneModel(
        numTask: json['numTask'],
        milestoneName: json['milestoneName'],
        listTask: List<TaskModel>.from(
            json['listTask'].map((x) => TaskModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'numTask': numTask,
        'milestoneName': milestoneName,
        'listTask': List<dynamic>.from(listTask.map((x) => x.toJson())),
      };
}

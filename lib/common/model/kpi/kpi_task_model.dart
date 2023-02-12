import 'kpi_detail_task_model.dart';

class KPITask {
  KPITask({
    this.task,
    this.nameContract,
    this.nameProject,
    this.nameMilestone,
    this.taskWorkingTime,
  });

  KPIDetailTaskModel? task;
  String? nameContract;
  String? nameProject;
  String? nameMilestone;
  List<dynamic>? taskWorkingTime;

  factory KPITask.fromJson(Map<String, dynamic> json) => KPITask(
        task: KPIDetailTaskModel.fromJson(json['Task']),
        nameContract: json['NameContract'],
        nameProject: json['NameProject'],
        nameMilestone: json['NameMilestone'],
        taskWorkingTime:
            List<dynamic>.from(json['TaskWorkingTime'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'Task': task!.toJson(),
        'NameContract': nameContract,
        'NameProject': nameProject,
        'NameMilestone': nameMilestone,
        'TaskWorkingTime':
            List<dynamic>.from(taskWorkingTime ?? [].map((x) => x)),
      };
}

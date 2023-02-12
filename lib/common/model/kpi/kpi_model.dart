import 'kpi_task_model.dart';

class KpiModel {
  KpiModel({
    this.userId,
    this.userName,
    this.allWorkingTime,
    this.starNumber,
    this.taskNumber,
    this.realWorkingDate,
    this.assignedWorkingDate,
    this.allWorkingDate,
    this.tasks,
  });

  String? userId;
  String? userName;
  double? allWorkingTime;
  double? starNumber;
  double? taskNumber;
  double? realWorkingDate;
  double? assignedWorkingDate;
  double? allWorkingDate;
  List<KPITask>? tasks;

  factory KpiModel.fromJson(Map<String, dynamic> json) => KpiModel(
        userId: json['UserId'],
        userName: json['UserName'],
        allWorkingTime: json['AllWorkingTime'],
        starNumber: json['StarNumber'],
        taskNumber: json['TaskNumber'],
        realWorkingDate: json['RealWorkingDate'],
        assignedWorkingDate: json['AssignedWorkingDate'],
        allWorkingDate:
            json['AllWorkingDate'] == 0.0 ? 0.0 : json['AllWorkingDate'],
        tasks:
            List<KPITask>.from(json['Tasks'].map((x) => KPITask.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'UserId': userId,
        'UserName': userName,
        'AllWorkingTime': allWorkingTime,
        'StarNumber': starNumber,
        'TaskNumber': taskNumber,
        'RealWorkingDate': realWorkingDate,
        'AssignedWorkingDate': assignedWorkingDate,
        'AllWorkingDate': allWorkingDate,
        'Tasks': List<dynamic>.from(tasks ?? [].map((x) => x)),
      };
}

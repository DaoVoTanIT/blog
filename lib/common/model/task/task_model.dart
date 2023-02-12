import 'package:cmms/common/model/file_upload/file_upload.dart';
import 'package:cmms/common/model/history_task_model/history_task_model.dart';
import 'package:cmms/common/model/task/task_db.dart';

class TaskModel {
  TaskModel({
    this.overdue,
    this.costTypeName,
    this.participateUserIds,
    this.taskLableIds,
    this.searchText,
    this.percentCompleted,
    this.taskTypeName,
    this.projectName,
    this.milestoneName,
    this.milestoneIndex,
    this.labelNames,
    this.participateInNames,
    this.contractName,
    this.indexStringProject,
    this.idContract,
    this.createbyName,
    this.asignUserName,
    this.asignUserAvatar,
    this.positionName,
    this.readComment,
    this.countComment,
    this.checklistNotfinish,
    this.totalChecklist,
    required this.db,
    this.toDoList,
    this.comment,
    this.listFileUpload,
  });

  dynamic overdue;
  dynamic costTypeName;
  List<String>? participateUserIds;
  List<String>? taskLableIds;
  String? searchText;
  double? percentCompleted;
  String? taskTypeName;
  String? projectName;
  String? milestoneName;
  int? milestoneIndex;
  List<dynamic>? labelNames;
  List<dynamic>? participateInNames;
  String? contractName;
  int? indexStringProject;
  String? idContract;
  String? createbyName;
  String? asignUserName;
  String? asignUserAvatar;
  dynamic positionName;
  bool? readComment;
  int? countComment;
  int? checklistNotfinish;
  dynamic totalChecklist;
  List<HistoryTaskModel> listHistory = [];
  TaskDB db;
  List<dynamic>? toDoList;
  List<dynamic>? comment;
  List<FileUploadModel>? listFileUpload;
  Map<String, dynamic> toJson() => {
        'Overdue': overdue,
        'CostTypeName': costTypeName,
        'ParticipateUserIds':
            List<dynamic>.from(participateUserIds ?? [].map((x) => x)),
        'TaskLableIds': List<dynamic>.from(taskLableIds ?? [].map((x) => x)),
        'SearchText': searchText,
        'PercentCompleted': percentCompleted,
        'TaskTypeName': taskTypeName,
        'ProjectName': projectName,
        'MilestoneName': milestoneName,
        'MilestoneIndex': milestoneIndex,
        'LabelNames': List<dynamic>.from(labelNames ?? [].map((x) => x)),
        'ParticipateInNames':
            List<dynamic>.from(participateInNames ?? [].map((x) => x)),
        'ContractName': contractName,
        'IndexStringProject': indexStringProject,
        'IdContract': idContract,
        'CreatebyName': createbyName,
        'AsignUserName': asignUserName,
        'AsignUserAvatar': asignUserAvatar,
        'PositionName': positionName,
        'ReadComment': readComment,
        'CountComment': countComment,
        'ChecklistNotfinish': checklistNotfinish,
        'TotalChecklist': totalChecklist,
        'Db': db.toJson(),
        'ListFileUpload':
            List<dynamic>.from(listFileUpload ?? [].map((x) => x.toJson())),
        'ToDoList': List<dynamic>.from(toDoList ?? [].map((x) => x)),
        'Comment': List<dynamic>.from(comment ?? [].map((x) => x)),
      };
  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      overdue: json['Overdue'],
      costTypeName: json['CostTypeName'],
      participateUserIds:
          List<String>.from(json['ParticipateUserIds'].map((x) => x)),
      taskLableIds: List<String>.from(json['TaskLableIds'].map((x) => x)),
      searchText: json['SearchText'],
      percentCompleted: json['PercentCompleted'],
      taskTypeName: json['TaskTypeName'],
      projectName: json['ProjectName'],
      milestoneName: json['MilestoneName'],
      milestoneIndex: json['MilestoneIndex'],
      labelNames: List<String>.from(json['LabelNames'] ?? [].map((x) => x)),
      participateInNames:
          List<dynamic>.from(json['ParticipateInNames'] ?? [].map((x) => x)),
      contractName: json['ContractName'],
      indexStringProject: json['IndexStringProject'],
      idContract: json['IdContract'],
      createbyName: json['CreatebyName'],
      asignUserName: json['AsignUserName'],
      asignUserAvatar: json['AsignUserAvatar'],
      positionName: json['PositionName'],
      readComment: json['ReadComment'],
      countComment: json['CountComment'],
      checklistNotfinish: json['ChecklistNotfinish'],
      totalChecklist: json['TotalChecklist'],
      db: TaskDB.fromJson(json['Db']),
      listFileUpload: List<FileUploadModel>.from(
          json['ListFileUpload'].map((x) => FileUploadModel.fromJson(x))),
      toDoList: List<dynamic>.from(json['ToDoList'].map((x) => x)),
      comment: List<dynamic>.from(json['Comment'].map((x) => x)));
}

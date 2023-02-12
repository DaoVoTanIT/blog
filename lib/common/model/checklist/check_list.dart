part 'check_list.g.dart';

class CheckListModel {
  CheckListModel({
    required this.createName,
    this.finishUserName,
    this.finishUserAvatar,
    this.db,
  });

  String createName;
  dynamic finishUserName;
  dynamic finishUserAvatar;
  Db? db;
  factory CheckListModel.fromJson(Map<String, dynamic> json) =>
      _$checkListModelJson(json);
  Map<String, dynamic> toJson() => _$checkListModelToJson(this);
}

class Db {
  Db({
    this.id,
    this.idTask,
    this.createBy,
    this.createDate,
    this.checklist,
    this.finishedBy,
    this.finishedDate,
    this.statusDel,
    this.statusFinish,
    this.stt,
  });

  String? id;
  String? idTask;
  String? createBy;
  DateTime? createDate;
  String? checklist;
  dynamic finishedBy;
  dynamic finishedDate;
  int? statusDel;
  bool? statusFinish;
  dynamic stt;

  factory Db.fromJson(Map<String, dynamic> json) => Db(
        id: json['Id'],
        idTask: json['idTask'],
        createBy: json['CreateBy'],
        createDate: DateTime.parse(json['CreateDate']),
        checklist: json['Checklist'],
        finishedBy: json['FinishedBy'],
        finishedDate: json['FinishedDate'],
        statusDel: json['StatusDel'],
        statusFinish: json['StatusFinish'],
        stt: json['Stt'],
      );
  Map<String, dynamic> toJson() => {
        'Id': id,
        'IdTask': idTask,
        'CreateBy': createBy,
        'CreateDate': createDate?.toIso8601String(),
        'Checklist': checklist,
        'FinishedDate': finishedDate,
        'StatusDel': statusDel,
        'FinishedBy': finishedBy,
        'StatusFinish': statusFinish,
        'Stt': stt,
      };
}

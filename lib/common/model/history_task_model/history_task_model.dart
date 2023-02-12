class HistoryTaskModel {
  HistoryTaskModel({
    this.isCurrentUser,
    this.workingUserAvatar,
    this.workingUserName,
    this.db,
  });

  bool? isCurrentUser;
  String? workingUserAvatar;
  String? workingUserName;
  HistoryTaskDb? db;

  factory HistoryTaskModel.fromJson(Map<String, dynamic> json) =>
      HistoryTaskModel(
        isCurrentUser: json['IsCurrentUser'],
        workingUserAvatar: json['WorkingUserAvatar'],
        workingUserName: json['WorkingUserName'],
        db: HistoryTaskDb.fromJson(json['Db']),
      );

  Map<String, dynamic> toJson() => {
        'IsCurrentUser': isCurrentUser,
        'WorkingUserAvatar': workingUserAvatar,
        'WorkingUserName': workingUserName,
        'Db': db?.toJson(),
      };
}

class HistoryTaskDb {
  HistoryTaskDb({
    required this.id,
    required this.idTask,
    this.startTime,
    this.endTime,
    this.duration,
    this.statusDel,
    this.note,
    this.createBy,
    this.createDate,
  });

  String id;
  String idTask;
  DateTime? startTime;
  DateTime? endTime;
  double? duration;
  int? statusDel;
  dynamic note;
  String? createBy;
  DateTime? createDate;

  factory HistoryTaskDb.fromJson(Map<String, dynamic> json) => HistoryTaskDb(
        id: json['Id'],
        idTask: json['IdTask'],
        startTime: json['StartTime'] == null
            ? null
            : DateTime.parse(json['StartTime']).toLocal(),
        endTime: json['EndTime'] == null
            ? null
            : DateTime.parse(json['EndTime']).toLocal(),
        duration: json['Duration'] == null ? 0 : json['Duration'].toDouble(),
        statusDel: json['StatusDel'],
        note: json['Note'],
        createBy: json['CreateBy'],
        createDate: DateTime.parse(json['CreateDate']).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'IdTask': idTask,
        'StartTime': startTime?.toIso8601String(),
        'EndTime': endTime?.toIso8601String(),
        'Duration': duration,
        'StatusDel': statusDel,
        'Note': note,
        'CreateBy': createBy,
        'CreateDate': createDate?.toIso8601String(),
      };
}

class TaskDB {
  TaskDB({
    required this.id,
    required this.name,
    this.note,
    this.idPosition,
    this.idCostType,
    required this.assignUserId,
    required this.assignDate,
    this.taskLableIds,
    required this.taskTypeId,
    required this.status,
    required this.userReadComment,
    required this.indexString,
    required this.participateUserId,
    required this.idProject,
    required this.idCustomer,
    required this.idMileStone,
    this.startTime,
    this.endTime,
    this.finishTime,
    this.durationHours,
    this.createDate,
    this.createBy,
    this.statusDel,
    this.locationName,
    this.locationLong,
    this.locationLat,
    this.rating1,
    this.rating2,
    this.noteRating1,
    this.noteRating2,
    this.dateRate1,
    this.dateRate2,
    this.rateBy1,
    this.rateBy2,
    this.statusCustomerEvaluation,
  });

  String id;
  String? name;
  dynamic note;
  String? idPosition;
  dynamic idCostType;
  String? assignUserId;
  DateTime? assignDate;
  dynamic taskLableIds;
  String? taskTypeId;
  int? status;
  String? userReadComment;
  int? indexString;
  String? participateUserId;
  String? idProject;
  String? idCustomer;
  String? idMileStone;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? finishTime;
  dynamic durationHours;
  DateTime? createDate;
  String? createBy;
  int? statusDel;
  dynamic locationName;
  dynamic locationLong;
  dynamic locationLat;
  dynamic rating1;
  dynamic rating2;
  dynamic noteRating1;
  dynamic noteRating2;
  dynamic dateRate1;
  dynamic dateRate2;
  dynamic rateBy1;
  dynamic rateBy2;
  dynamic statusCustomerEvaluation;
  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Note': note,
        'IdPosition': idPosition,
        'IdCostType': idCostType,
        'AssignUserId': assignUserId,
        'AssignDate': assignDate?.toIso8601String(),
        'TaskLableIds': taskLableIds,
        'TaskTypeId': taskTypeId,
        'Status': status,
        'UserReadComment': userReadComment,
        'IndexString': indexString,
        'ParticipateUserId': participateUserId,
        'IdProject': idProject,
        'IdCustomer': idCustomer,
        'IdMileStone': idMileStone,
        'StartTime': startTime?.toIso8601String(),
        'EndTime': endTime?.toIso8601String(),
        'FinishTime': finishTime?.toIso8601String(),
        'DurationHours': durationHours,
        'CreateDate': createDate?.toIso8601String(),
        'CreateBy': createBy,
        'StatusDel': statusDel,
        'LocationName': locationName,
        'LocationLong': locationLong,
        'LocationLat': locationLat,
        'Rating1': rating1,
        'Rating2': rating2,
        'NoteRating1': noteRating1,
        'NoteRating2': noteRating2,
        'DateRate1': dateRate1,
        'DateRate2': dateRate2,
        'RateBy1': rateBy1,
        'RateBy2': rateBy2,
        'StatusCustomerEvaluation': statusCustomerEvaluation,
      };

  factory TaskDB.fromJson(Map<String, dynamic> json) => TaskDB(
        id: json['Id'],
        name: json['Name'],
        note: json['Note'],
        idPosition: json['IdPosition'],
        idCostType: json['IdCostType'],
        assignUserId: json['AssignUserId'],
        assignDate: json['AssignDate'] == null
            ? null
            : DateTime.parse(json['AssignDate']),
        taskLableIds: json['TaskLableIds'],
        taskTypeId: json['TaskTypeId'],
        status: json['Status'],
        userReadComment: json['UserReadComment'],
        indexString: json['IndexString'],
        participateUserId: json['ParticipateUserId'],
        idProject: json['IdProject'],
        idCustomer: json['IdCustomer'],
        idMileStone: json['IdMileStone'],
        startTime: json['StartTime'] == null
            ? null
            : DateTime.parse(json['StartTime']),
        endTime:
            json['EndTime'] == null ? null : DateTime.parse(json['EndTime']),
        finishTime: json['FinishTime'] == null
            ? null
            : DateTime.parse(json['FinishTime']),
        durationHours: json['DurationHours'],
        createDate: json['CreateDate'] == null
            ? null
            : DateTime.parse(json['CreateDate']),
        createBy: json['CreateBy'],
        statusDel: json['StatusDel'],
        locationName: json['LocationName'],
        locationLong: json['LocationLong'],
        locationLat: json['LocationLat'],
        rating1: json['Rating1'],
        rating2: json['Rating2'],
        noteRating1: json['NoteRating1'],
        noteRating2: json['NoteRating2'],
        dateRate1: json['DateRate1'],
        dateRate2: json['DateRate2'],
        rateBy1: json['RateBy1'],
        rateBy2: json['RateBy2'],
        statusCustomerEvaluation: json['StatusCustomerEvaluation'],
      );
}

class ReportCompleteModel {
  ReportCompleteModel({
    required this.idContract,
    required this.contractName,
    required this.taskTypeName,
    required this.participateUserIds,
    required this.db,
  });
  String idContract;
  String contractName;
  String taskTypeName;

  List<String> participateUserIds;

  Db db;

  factory ReportCompleteModel.fromJson(Map<String, dynamic> json) =>
      ReportCompleteModel(
        idContract: json['id_contract'],
        contractName: json['contract_name'],
        taskTypeName: json['task_type_name'],
        participateUserIds:
            List<String>.from(json['participate_user_ids'].map((x) => x)),
        db: Db.fromJson(json['db']),
      );
}

class Db {
  Db(
      {required this.id,
      required this.status,
      required this.finishTime,
      required this.name,
      required this.participateUserId});
  String id;
  int status;
  DateTime finishTime;
  String name;
  dynamic participateUserId;
  factory Db.fromJson(Map<String, dynamic> json) => Db(
        id: json['id'],
        status: json['status'],
        finishTime: DateTime.parse(json['finish_time']),
        name: json['name'],
        participateUserId: json['participate_user_id'],
      );
}

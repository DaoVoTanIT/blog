part 'message_model.g.dart';

class MessageModel {
  MessageModel({
    this.avatarPath,
    this.createName,
  });

  String? avatarPath;
  String? createName;
  MessageDb? db;
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$messageModelFromJson(json);
  Map<String, dynamic> toJson() => _$messageModelToJson(this);
}

class MessageDb {
  MessageDb({
    this.id,
    this.idTask,
    this.userSend,
    this.dateSend,
    this.msg,
    this.statusDel,
    this.type,
    this.filePath,
    this.fileName,
    this.fileSize,
    this.fileType,
  });

  String? id;
  String? idTask;
  String? userSend;
  DateTime? dateSend;
  String? msg;
  int? statusDel;
  int? type;
  dynamic filePath;
  dynamic fileName;
  dynamic fileSize;
  dynamic fileType;

  factory MessageDb.fromJson(Map<String, dynamic> json) => MessageDb(
        id: json['Id'],
        idTask: json['IdTask'],
        userSend: json['UserSend'],
        dateSend: DateTime.parse(json['DateSend']).toLocal(),
        msg: json['Msg'],
        statusDel: json['StatusDel'],
        type: json['Type'],
        filePath: json['FilePath'],
        fileName: json['FileName'],
        fileSize: json['FileSize'],
        fileType: json['FileType'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'idTask': idTask,
        'userSend': userSend,
        'dateSend': dateSend?.toIso8601String(),
        'msg': msg,
        'statusDel': statusDel,
        'type': type,
        'filePath': filePath,
        'fileName': fileName,
        'fileSize': fileSize,
        'fileType': fileType,
      };
}

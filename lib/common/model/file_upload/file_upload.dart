class FileUploadModel {
  FileUploadModel({
    this.db,
  });

  FileUploadDb? db;

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      FileUploadModel(
        db: FileUploadDb.fromJson(json['Db']),
      );

  Map<String, dynamic> toJson() => {
        'Db': db?.toJson(),
      };
}

class FileUploadDb {
  FileUploadDb({
    this.id,
    this.idTask,
    this.filePath,
    this.fileName,
    this.fileSize,
    this.fileType,
    this.stt,
    this.removeDate,
    this.removeBy,
    this.uploadDate,
    this.uploadBy,
    this.statusDel,
    this.idDocumentType,
  });

  String? id;
  String? idTask;
  String? filePath;
  String? fileName;
  int? fileSize;
  String? fileType;
  dynamic stt;
  dynamic removeDate;
  dynamic removeBy;
  DateTime? uploadDate;
  String? uploadBy;
  int? statusDel;
  dynamic idDocumentType;

  factory FileUploadDb.fromJson(Map<String, dynamic> json) => FileUploadDb(
        id: json['Id'],
        idTask: json['IdTask'],
        filePath: json['FilePath'],
        fileName: json['FileName'],
        fileSize: json['FileSize'],
        fileType: json['FileType'],
        stt: json['Stt'],
        removeDate: json['RemoveDate'],
        removeBy: json['RemoveBy'],
        uploadDate: json['UploadDate'] == null
            ? null
            : DateTime.parse(json['UploadDate']),
        uploadBy: json['UploadBy'],
        statusDel: json['StatusDel'],
        idDocumentType: json['IdDocumentType'],
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'IdTask': idTask,
        'FilePath': filePath,
        'FileName': fileName,
        'FileSize': fileSize,
        'FileType': fileType,
        'Stt': stt,
        'RemoveDate': removeDate,
        'RemoveBy': removeBy,
        'UploadDate': uploadDate?.toIso8601String(),
        'UploadBy': uploadBy,
        'StatusDel': statusDel,
        'IdDocumentType': idDocumentType,
      };
}

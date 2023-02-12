import 'package:cmms/common/model/assets/common_code.dart';

class CmmsAssetDocument {
  CmmsAssetDocument({
    this.documentId = '',
    this.documentName = '',
    this.documentPath = '',
    this.documentSize = 0,
    this.fileType = '',
    this.assetId = '',
    this.documentTypeCode,
    this.commonCode,
    this.createDate,
    this.createdUserId = '',
    this.updateDate,
    this.updatedUserId = '',
  });

  String documentId;
  String documentName;
  String documentPath;
  int documentSize;
  String fileType;
  String assetId;
  dynamic documentTypeCode;
  CommonCode? commonCode;
  DateTime? createDate;
  String createdUserId;
  DateTime? updateDate;
  String updatedUserId;

  factory CmmsAssetDocument.fromJson(Map<String, dynamic> json) =>
      CmmsAssetDocument(
        documentId: json['documentId'] ?? '',
        documentName: json['documentName'] ?? '',
        documentPath: json['documentPath'] ?? '',
        documentSize: json['documentSize'] ?? 0,
        fileType: json['fileType'] ?? '',
        assetId: json['assetId'] ?? '',
        documentTypeCode: json['documentTypeCode'] ?? '',
        commonCode: json['commonCode'] == null
            ? null
            : CommonCode.fromJson(json['commonCode']),
        createDate: json['createDate'] == null
            ? null
            : DateTime.parse(json['createDate']),
        createdUserId: json['createdUserId'] ?? '',
        updateDate: json['updateDate'] == null
            ? null
            : DateTime.parse(json['updateDate']),
        updatedUserId: json['updatedUserId'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'documentId': documentId,
        'documentName': documentName,
        'documentPath': documentPath,
        'documentSize': documentSize,
        'fileType': fileType,
        'assetId': assetId,
        'documentTypeCode': documentTypeCode,
        'commonCode': commonCode?.toJson(),
        'createDate': createDate?.toIso8601String(),
        'createdUserId': createdUserId,
        'updateDate': updateDate?.toIso8601String(),
        'updatedUserId': updatedUserId,
      };
}

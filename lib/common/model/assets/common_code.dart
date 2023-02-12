class CommonCode {
  CommonCode({
    this.commonCode = '',
    this.parentCode = '',
    this.codeDescription,
    this.codeLevel = 0,
    this.codeName = '',
    this.codeShortName,
    this.colorValue,
    this.cmmsProcedures,
    this.cmmsAssets,
    //  this.documents=,
    this.orderByNumber = 0,
    this.useFlag = '',
    this.deleteStatusFlag = '',
    this.createDate,
    this.createdUserId = '',
    this.updateDate,
    this.updatedUserId = '',
  });

  String commonCode;
  String parentCode;
  dynamic codeDescription;
  int codeLevel;
  String codeName;
  dynamic codeShortName;
  dynamic colorValue;
  dynamic cmmsProcedures;
  dynamic cmmsAssets;
  // List<dynamic> documents;
  int orderByNumber;
  String useFlag;
  String deleteStatusFlag;
  DateTime? createDate;
  String createdUserId;
  DateTime? updateDate;
  String updatedUserId;

  factory CommonCode.fromJson(Map<String, dynamic> json) => CommonCode(
        commonCode: json['commonCode'] ?? '',
        parentCode: json['parentCode'] ?? '',
        codeDescription: json['codeDescription'] ?? '',
        codeLevel: json['codeLevel'] ?? 0,
        codeName: json['codeName'] ?? '',
        codeShortName: json['codeShortName'] ?? '',
        colorValue: json['colorValue'] ?? '',
        cmmsProcedures: json['cmmsProcedures'] ?? '',
        cmmsAssets: json['cmmsAssets'] ?? '',
        //documents: List<dynamic>.from(json['documents'].map((x) => x)),
        orderByNumber: json['orderByNumber'] ?? '',
        useFlag: json['useFlag'] ?? '',
        deleteStatusFlag: json['deleteStatusFlag'] ?? '',
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
        'commonCode': commonCode,
        'parentCode': parentCode,
        'codeDescription': codeDescription,
        'codeLevel': codeLevel,
        'codeName': codeName,
        'codeShortName': codeShortName,
        'colorValue': colorValue,
        'cmmsProcedures': cmmsProcedures,
        'cmmsAssets': cmmsAssets,
        //  'documents': List<dynamic>.from(documents.map((x) => x)),
        'orderByNumber': orderByNumber,
        'useFlag': useFlag,
        'deleteStatusFlag': deleteStatusFlag,
        'createDate': createDate?.toIso8601String(),
        'createdUserId': createdUserId,
        'updateDate': updateDate?.toIso8601String(),
        'updatedUserId': updatedUserId,
      };
}

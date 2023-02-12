import 'package:cmms/common/model/assets/cmms_asset_document.dart';
import 'package:cmms/common/model/assets/cmms_assets_activity.dart';
import 'package:cmms/common/model/assets/cmms_assets_item.dart';

class AssetsModel {
  AssetsModel({
    required this.data,
  });

  List<AssetsDb> data;

  factory AssetsModel.fromJson(Map<String, dynamic> json) => AssetsModel(
        data:
            List<AssetsDb>.from(json['data'].map((x) => AssetsDb.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AssetsDb {
  AssetsDb({
    this.assetLocationName = '',
    this.manufacturerName = '',
    this.assetTypeName = '',
    required this.parentAsset,
    required this.listSubAsset,
    required this.db,
  });

  String assetLocationName;
  String manufacturerName;
  String assetTypeName;
  Db? parentAsset;
  List<AssetsDb>? listSubAsset;
  Db db;

  factory AssetsDb.fromJson(Map<String, dynamic> json) => AssetsDb(
        assetLocationName: json['assetLocationName'] ?? '',
        manufacturerName: json['manufacturerName'] ?? '',
        assetTypeName: json['assetTypeName'] ?? '',
        parentAsset: json['parentAsset'] == null
            ? null
            : Db.fromJson(json['parentAsset']),
        listSubAsset: json['listSubAsset'] == null
            ? []
            : List<AssetsDb>.from(
                json['listSubAsset'].map((x) => AssetsDb.fromJson(x))),
        db: Db.fromJson(json['db']),
      );

  Map<String, dynamic> toJson() => {
        'assetLocationName': assetLocationName,
        'manufacturerName': manufacturerName,
        'assetTypeName': assetTypeName,
        'parentAsset': parentAsset?.toJson(),
        'listSubAsset':
            List<dynamic>.from(listSubAsset ?? [].map((x) => x.toJson())),
        'db': db.toJson(),
      };
}

class Db {
  Db({
    // this.cmmsAssetProcedures,
    this.assetId = '',
    this.assetCode = '',
    this.assetName = '',
    this.imageUrl = '',
    this.parentAssetId = '',
    this.serialNumber = '',
    this.model = '',
    this.description = '',
    this.datePurchase,
    this.dateInstall,
    this.warrantyTime = 0,
    this.barcode = '',
    this.orderByNumber = 0,
    this.locationId = '',
    this.vendorId = '',
    this.activeFlag = '',
    this.deleteStatusFlag = '',
    this.assetStatusCode = '',
    this.assetTypeCode = '',
    this.manufacturerCode = '',
    this.codeLevel = 0,
    this.location = '',
    this.commonAssetStatusCode = '',
    this.vendor = '',
    required this.cmmsAssetActivities,
    required this.cmmsAssetDocuments,
    required this.cmmsAssetItems,
    this.createDate,
    this.createdUserId = '',
    this.updateDate,
    this.updatedUserId = '',
  });

//  List<dynamic> cmmsAssetProcedures;
  String assetId;
  String assetCode;
  String assetName;
  String imageUrl;
  String parentAssetId;
  String serialNumber;
  String model;
  String description;
  DateTime? datePurchase;
  DateTime? dateInstall;
  int warrantyTime;
  String barcode;
  int orderByNumber;
  String locationId;
  String vendorId;
  String activeFlag;
  String deleteStatusFlag;
  String assetStatusCode;
  String assetTypeCode;
  String manufacturerCode;
  int codeLevel;
  String location;
  String commonAssetStatusCode;
  String vendor;
  List<CmmsAssetActivity> cmmsAssetActivities;
  List<CmmsAssetDocument> cmmsAssetDocuments;
  List<CmmsAssetItem> cmmsAssetItems;
  DateTime? createDate;
  String createdUserId;
  DateTime? updateDate;
  String updatedUserId;

  factory Db.fromJson(Map<String, dynamic> json) => Db(
        // cmmsAssetProcedures:
        //     List<dynamic>.from(json['cmmsAssetProcedures'].map((x) => x)),
        assetId: json['assetId'] ?? '',
        assetCode: json['assetCode'] ?? '',
        assetName: json['assetName'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        parentAssetId: json['parentAssetId'] ?? '',
        serialNumber: json['serialNumber'] ?? '',
        model: json['model'] ?? '',
        description: json['description'] ?? '',
        datePurchase: json['datePurchase'] == null
            ? null
            : DateTime.parse(json['datePurchase']),
        dateInstall: json['dateInstall'] == null
            ? null
            : DateTime.parse(json['dateInstall']),
        warrantyTime:
            json['warrantyTime'] == null ? 0 : json['warrantyTime'] ?? 0,
        barcode: json['barcode'] ?? '',
        orderByNumber: json['orderByNumber'] ?? 0,
        locationId: json['locationId'] ?? '',
        vendorId: json['vendorId'] ?? '',
        activeFlag: json['activeFlag'] ?? '',
        deleteStatusFlag: json['deleteStatusFlag'] ?? '',
        assetStatusCode: json['assetStatusCode'] ?? '',
        assetTypeCode: json['assetTypeCode'] ?? '',
        manufacturerCode: json['manufacturerCode'] ?? '',
        codeLevel: json['codeLevel'],
        location: json['location'] ?? '',
        commonAssetStatusCode: json['commonAssetStatusCode'] ?? '',
        vendor: json['vendor'] ?? '',
        cmmsAssetActivities: List<CmmsAssetActivity>.from(
            json['cmmsAssetActivities']
                .map((x) => CmmsAssetActivity.fromJson(x))),
        cmmsAssetDocuments: List<CmmsAssetDocument>.from(
            json['cmmsAssetDocuments']
                .map((x) => CmmsAssetDocument.fromJson(x))),
        cmmsAssetItems: List<CmmsAssetItem>.from(
            json['cmmsAssetItems'].map((x) => CmmsAssetItem.fromJson(x))),
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
        // 'cmmsAssetProcedures':
        //     List<dynamic>.from(cmmsAssetProcedures.map((x) => x)),
        'assetId': assetId,
        'assetCode': assetCode,
        'assetName': assetName,
        'imageUrl': imageUrl,
        'parentAssetId': parentAssetId,
        'serialNumber': serialNumber,
        'model': model,
        'description': description,
        'datePurchase': datePurchase?.toIso8601String(),
        'dateInstall': dateInstall?.toIso8601String(),
        'warrantyTime': warrantyTime,
        'barcode': barcode,
        'orderByNumber': orderByNumber,
        'locationId': locationId,
        'vendorId': vendorId,
        'activeFlag': activeFlag,
        'deleteStatusFlag': deleteStatusFlag,
        'assetStatusCode': assetStatusCode,
        'assetTypeCode': assetTypeCode,
        'manufacturerCode': manufacturerCode,
        'codeLevel': codeLevel,
        'location': location,
        'commonAssetStatusCode': commonAssetStatusCode,
        'vendor': vendor,
        'cmmsAssetActivities':
            List<dynamic>.from(cmmsAssetActivities.map((x) => x.toJson())),
        'cmmsAssetDocuments':
            List<dynamic>.from(cmmsAssetDocuments.map((x) => x.toJson())),
        'cmmsAssetItems':
            List<dynamic>.from(cmmsAssetItems.map((x) => x.toJson())),
        'createDate': createDate?.toIso8601String(),
        'createdUserId': createdUserId,
        'updateDate': updateDate?.toIso8601String(),
        'updatedUserId': updatedUserId,
      };
}

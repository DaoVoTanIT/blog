class CmmsAssetItem {
  CmmsAssetItem({
    this.id = '',
    this.itemId = '',
    this.assetId = '',
    this.quantity = 0,
    required this.item,
    this.createDate,
    this.createdUserId = '',
    this.updateDate,
    this.updatedUserId = '',
  });

  String id;
  String itemId;
  String assetId;
  int quantity;
  Item item;
  DateTime? createDate;
  String createdUserId;
  DateTime? updateDate;
  String updatedUserId;

  factory CmmsAssetItem.fromJson(Map<String, dynamic> json) => CmmsAssetItem(
        id: json['id'] ?? '',
        itemId: json['itemId'] ?? '',
        assetId: json['assetId'] ?? '',
        quantity: json['quantity'] ?? 0,
        item: Item.fromJson(json['item']),
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
        'id': id,
        'itemId': itemId,
        'assetId': assetId,
        'quantity': quantity,
        'item': item.toJson(),
        'createDate': createDate?.toIso8601String(),
        'createdUserId': createdUserId,
        'updateDate': updateDate?.toIso8601String(),
        'updatedUserId': updatedUserId,
      };
}

class Item {
  Item({
    this.itemId = '',
    this.itemName = '',
    this.categoryId = '',
    this.productFlag = '',
    this.materialFlag = '',
    this.procurementFlag = '',
    this.unitOfMeasure = '',
    this.parameterFlag = '',
    this.category = '',
    //  this.cmmsAssetItems,
    this.partFlag = '',
    this.createDate,
    this.createdUserId = '',
    this.updateDate,
    this.updatedUserId = '',
  });

  String itemId;
  String itemName;
  String categoryId;
  String productFlag;
  String materialFlag;
  String procurementFlag;
  String unitOfMeasure;
  String parameterFlag;
  String category;
//  List<dynamic> cmmsAssetItems;
  String partFlag;
  DateTime? createDate;
  String createdUserId;
  DateTime? updateDate;
  String updatedUserId;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json['itemId'] ?? '',
        itemName: json['itemName'] ?? '',
        categoryId: json['categoryId'] ?? '',
        productFlag: json['productFlag'] ?? '',
        materialFlag: json['materialFlag'] ?? '',
        procurementFlag: json['procurementFlag'] ?? '',
        unitOfMeasure: json['unitOfMeasure'] ?? '',
        parameterFlag: json['parameterFlag'] ?? '',
        category: json['category'] ?? '',
        // cmmsAssetItems:
        //     List<dynamic>.from(json['cmmsAssetItems'].map((x) => x)),
        partFlag: json['partFlag'] ?? '',
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
        'itemId': itemId,
        'itemName': itemName,
        'categoryId': categoryId,
        'productFlag': productFlag,
        'materialFlag': materialFlag,
        'procurementFlag': procurementFlag,
        'unitOfMeasure': unitOfMeasure,
        'parameterFlag': parameterFlag,
        'category': category,
        // 'cmmsAssetItems': List<dynamic>.from(cmmsAssetItems.map((x) => x)),
        'partFlag': partFlag,
        'createDate': createDate,
        'createdUserId': createdUserId,
        'updateDate': updateDate,
        'updatedUserId': updatedUserId,
      };
}

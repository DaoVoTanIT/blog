class CmmsAssetActivity {
  CmmsAssetActivity({
    this.assetActivityId = '',
    this.assetId = '',
    this.title = '',
    this.comment,
    // this.cmmsAssetActivityFiles,
    this.createDate,
    this.createdUserId = '',
    this.updateDate,
    this.updatedUserId = '',
  });

  String assetActivityId;
  String assetId;
  String title;
  dynamic comment;
  //List<dynamic> cmmsAssetActivityFiles;
  DateTime? createDate;
  String createdUserId;
  DateTime? updateDate;
  String updatedUserId;

  factory CmmsAssetActivity.fromJson(Map<String, dynamic> json) =>
      CmmsAssetActivity(
        assetActivityId: json['assetActivityId'] ?? '',
        assetId: json['assetId'] ?? '',
        title: json['title'] ?? '',
        comment: json['comment'] ?? '',
        // cmmsAssetActivityFiles:
        //     List<dynamic>.from(json['cmmsAssetActivityFiles'].map((x) => x)),
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
        'assetActivityId': assetActivityId,
        'assetId': assetId,
        'title': title,
        'comment': comment,
        // 'cmmsAssetActivityFiles':
        //     List<dynamic>.from(cmmsAssetActivityFiles.map((x) => x)),
        'createDate': createDate?.toIso8601String(),
        'createdUserId': createdUserId,
        'updateDate': updateDate?.toIso8601String(),
        'updatedUserId': updatedUserId,
      };
}

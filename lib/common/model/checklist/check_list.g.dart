// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListModel _$checkListModelJson(Map<String, dynamic> json) {
  return CheckListModel(createName: '')
    ..createName = json['CreateName']
    ..finishUserName = json['FinishUserName']
    ..finishUserAvatar = json['FinishUserAvatar']
    ..db = Db.fromJson(json['Db']);
}

Map<String, dynamic> _$checkListModelToJson(CheckListModel instance) =>
    <String, dynamic>{
      'CreateName': instance.createName,
      'FinishUserName': instance.finishUserAvatar,
      'FinishUserAvatar': instance.finishUserAvatar,
      'Db': instance.db
    };

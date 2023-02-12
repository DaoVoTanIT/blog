// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$messageModelFromJson(Map<String, dynamic> json) {
  return MessageModel()
    ..avatarPath = json['AvatarPath']
    ..createName = json['CreateName']
    ..db = MessageDb.fromJson(json['Db']);
}

Map<String, dynamic> _$messageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'AvatarPath': instance.avatarPath,
      'CreateName': instance.createName,
      'Db': instance.db
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenNotiUserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenNotiUserModel _$TokenNotiUserModelFromJson(Map<String, dynamic> json) {
  return TokenNotiUserModel()
    ..id = json['id'] as String?
    ..domain = json['domain'] as String?
    ..user_id = json['user_id'] as String?
    ..token_firebase = json['token_firebase'] as String?
    ..create_date = json['create_date'] == null ? null : DateTime.parse(json['create_date'] as String)
    ..count_notification = json['count_notification'] as int?
    ..date_upDate = json['date_upDate'] == null ? null : DateTime.parse(json['date_upDate'] as String)
    ..user_name = json['user_name'] as String?;
}

Map<String, dynamic> _$TokenNotiUserModelToJson(TokenNotiUserModel instance) => <String, dynamic>{
      'id': instance.id,
      'domain': instance.domain,
      'user_id': instance.user_id,
      'token_firebase': instance.token_firebase,
      'create_date': instance.create_date?.toIso8601String(),
      'count_notification': instance.count_notification,
      'user_name': instance.user_name,
      'date_upDate': instance.date_upDate?.toIso8601String(),
    };

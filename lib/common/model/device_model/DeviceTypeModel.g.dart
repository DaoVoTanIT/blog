// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeviceTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceTypeModel _$DeviceTypeModelFromJson(Map<String, dynamic> json) {
  return DeviceTypeModel()
    ..device_id = json['device_id'] as String?
    ..device_type = json['device_type'] as String?
    ..device_version = json['device_version'] as String?
    ..device_name = json['device_name'] as String?
    ..token_firebase = json['token_firebase'] as String?
    ..date_sign_in = json['date_sign_in'] as int?
    ..status = json['status'] as int?;
}

Map<String, dynamic> _$DeviceTypeModelToJson(DeviceTypeModel instance) =>
    <String, dynamic>{
      'device_id': instance.device_id,
      'device_type': instance.device_type,
      'device_version': instance.device_version,
      'device_name': instance.device_name,
      'token_firebase': instance.token_firebase,
      'date_sign_in': instance.date_sign_in,
      'status': instance.status,
    };

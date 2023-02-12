// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel(
    id: '',
    title: '',
    desc: '',
    send_time_index: 0,
    user_id_create: '',
    user_id_receive: '',
    image: '',
    status: 0,
    domain: '',
  )
    ..id = json['id']
    ..title = json['title']
    ..desc = json['desc']
    ..send_time_index = json['send_time_index']
    ..user_id_receive = json['user_id_receive'] as String?
    ..user_id_create = json['user_id_create'] as String?
    ..image = json['image']
    ..status = json['status']
    ..domain = json['domain']
    ..param = json['param'] as Map<String, dynamic>?
    ..route = json['route'] as String?;
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'send_time_index': instance.send_time_index,
      'user_id_receive': instance.user_id_receive,
      'user_id_create': instance.user_id_create,
      'image': instance.image,
      'status': instance.status,
      'domain': instance.domain,
      'param': instance.param,
      'route': instance.route,
    };

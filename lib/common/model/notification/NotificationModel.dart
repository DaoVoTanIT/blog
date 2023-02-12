// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'NotificationModel.g.dart';

@JsonSerializable()
class NotificationModel {
  NotificationModel(
      {required this.id,
      required this.desc,
      required this.domain,
      required this.image,
      required this.send_time_index,
      required this.status,
      required this.title,
      required this.user_id_create,
      required this.user_id_receive});
  //userid+id_building
  String id;
  String desc;
  String domain;
  String image;
  int send_time_index;
  int status;
  String title;
  // 1 la send , 2 read
  String? user_id_create;
  String? user_id_receive;
  Map<String, dynamic>? param;
  String? route;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

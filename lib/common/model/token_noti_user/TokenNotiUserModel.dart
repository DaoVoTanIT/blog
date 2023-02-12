// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'TokenNotiUserModel.g.dart';

@JsonSerializable()
class TokenNotiUserModel {
  TokenNotiUserModel();
  //userid+id_building
  String? id;
  String? domain;
  String? user_id;
  String? token_firebase;
  DateTime? create_date;
  int? count_notification;
  String? user_name;
  DateTime? date_upDate;

  factory TokenNotiUserModel.fromJson(Map<String, dynamic> json) =>
      _$TokenNotiUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenNotiUserModelToJson(this);
}

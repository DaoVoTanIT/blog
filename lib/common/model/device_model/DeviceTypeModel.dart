// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'DeviceTypeModel.g.dart';

@JsonSerializable()
class DeviceTypeModel {
  DeviceTypeModel();
  //userid+id_building
  String? device_id;
  String? device_type;
  String? device_version;
  String? device_name;
  String? token_firebase;
  int? status;
  int? date_sign_in;

  factory DeviceTypeModel.fromJson(Map<String, dynamic> json) => _$DeviceTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceTypeModelToJson(this);
}

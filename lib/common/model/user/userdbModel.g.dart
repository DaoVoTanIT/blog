// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdbModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserdbModel _$userdbModelFromJson(Map<String, dynamic> json) {
  return UserdbModel()
    ..departmentName = json['department_name'] as String?
    ..jobTitleName = json['job_title_name'] as String?
    ..password = json['password'] as String?
    ..db = DbUser.fromJson(json['db']);
}

Map<String, dynamic> _$userdbModelToJson(UserdbModel instance) => <String, dynamic>{
      'department_name': instance.departmentName,
      'job_title_name': instance.jobTitleName,
      'password': instance.password,
      'db': instance.db
    };

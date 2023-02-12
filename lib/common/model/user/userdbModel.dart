// // ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'userdbModel.g.dart';

@JsonSerializable()
class UserdbModel {
  UserdbModel();
 String? departmentName;
 String? jobTitleName;
 String? password;
 late DbUser db;
  factory UserdbModel.fromJson(Map<String, dynamic> json) =>
      _$userdbModelFromJson(json);
  Map<String, dynamic> toJson() => _$userdbModelToJson(this);
}

class DbUser {
  DbUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.passwordHash,
      this.passwordSalt,
      this.user,
      this.avatarPath,
      this.email,
      this.phone});
  String? id;
  String? firstName;
  String? lastName;
  String? passwordHash;
  String? passwordSalt;
  String? user;
  String? avatarPath;
  String? email;
  String? phone;
   factory DbUser.fromJson(Map<String, dynamic> json) => DbUser(
     id: json['Id'],
     firstName: json['FirstName'],
     lastName: json['LastName'],
     passwordHash: json['PasswordHash'],
     passwordSalt: json['PasswordSalt'],
     user: json['Username'],
     avatarPath: json['avatar_path'],
     email: json['email'],
     phone: json['phone'],
   );
}

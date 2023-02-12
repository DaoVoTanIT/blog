class UserProfile {
  UserProfile({
    this.id,
    this.userName,
    this.avatarPath,
    this.email,
    this.phone,
    this.fullName,
  });

  String? id;
  String? userName;
  String? avatarPath;
  String? email;
  dynamic phone;
  String? fullName;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'],
        userName: json['user_name'],
        avatarPath: json['avatar_path'],
        email: json['email'],
        phone: json['phone'],
        fullName: json['full_name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_name': userName,
        'avatar_path': avatarPath,
        'email': email,
        'phone': phone,
        'full_name': fullName,
      };
}

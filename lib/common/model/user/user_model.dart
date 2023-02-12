class UserModel {
  UserModel({
    required this.data,
  });

  UserData data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: UserData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
      };
}

class UserData {
  UserData({
    this.accessToken = '',
    this.refreshToken = '',
    required this.user,
  });

  String accessToken;
  String refreshToken;
  User user;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        accessToken: json['accessToken'] ?? '',
        refreshToken: json['refreshToken'] ?? '',
        user: User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'user': user.toJson(),
      };
}

class User {
  User({
    this.id = '',
    this.passwordHash = '',
    this.fullName = '',
    this.birthdayValue,
    this.activeFlag = '',
    this.deleteStatusFlag = '',
    this.imageUrl,
    this.address = '',
    this.userRole,
    this.userName = '',
    this.normalizedUserName = '',
    this.email = '',
    this.normalizedEmail = '',
    this.emailConfirmed = false,
    this.securityStamp = '',
    this.concurrencyStamp = '',
    this.phoneNumber = '',
    this.phoneNumberConfirmed = false,
    this.twoFactorEnabled = false,
    this.lockoutEnd,
    this.lockoutEnabled = false,
    this.accessFailedCount = 0,
  });

  String id;
  String passwordHash;
  String fullName;
  DateTime? birthdayValue;
  String activeFlag;
  String deleteStatusFlag;
  dynamic imageUrl;
  String address;
  dynamic userRole;
  String userName;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  dynamic lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? '',
        passwordHash: json['passwordHash'] ?? '',
        fullName: json['fullName'] ?? '',
        birthdayValue: json['birthdayValue'] == null
            ? json['birthdayValue']
            : DateTime.parse(json['birthdayValue']),
        activeFlag: json['activeFlag'] ?? '',
        deleteStatusFlag: json['deleteStatusFlag'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        address: json['address'] ?? '',
        userRole: json['userRole'] ?? '',
        userName: json['userName'] ?? '',
        normalizedUserName: json['normalizedUserName'] ?? '',
        email: json['email'] ?? '',
        normalizedEmail: json['normalizedEmail'] ?? '',
        emailConfirmed: json['emailConfirmed'] ?? '',
        securityStamp: json['securityStamp'] ?? '',
        concurrencyStamp: json['concurrencyStamp'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        phoneNumberConfirmed: json['phoneNumberConfirmed'] ?? '',
        twoFactorEnabled: json['twoFactorEnabled'] ?? '',
        lockoutEnd: json['lockoutEnd'] ?? '',
        lockoutEnabled: json['lockoutEnabled'] ?? '',
        accessFailedCount: json['accessFailedCount'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'passwordHash': passwordHash,
        'fullName': fullName,
        'birthdayValue': birthdayValue?.toIso8601String(),
        'activeFlag': activeFlag,
        'deleteStatusFlag': deleteStatusFlag,
        'imageUrl': imageUrl,
        'address': address,
        'userRole': userRole,
        'userName': userName,
        'normalizedUserName': normalizedUserName,
        'email': email,
        'normalizedEmail': normalizedEmail,
        'emailConfirmed': emailConfirmed,
        'securityStamp': securityStamp,
        'concurrencyStamp': concurrencyStamp,
        'phoneNumber': phoneNumber,
        'phoneNumberConfirmed': phoneNumberConfirmed,
        'twoFactorEnabled': twoFactorEnabled,
        'lockoutEnd': lockoutEnd,
        'lockoutEnabled': lockoutEnabled,
        'accessFailedCount': accessFailedCount,
      };
}

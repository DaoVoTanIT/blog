import 'package:cmms/common/model/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class AccountRepository {
  Dio client;
  AccountRepository({required this.client});
  late UserModel user;
  Future<UserModel?> getInformationUser() async {
    try {
      final response = await client.get(
        '/api/auth/GetCurrentUser',
      );

      user = UserModel.fromJson(response.data);
      return user;
    } on DioError catch (ex) {
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }

  Future<String> changePassword(String oldPassword, String password) async {
    try {
      final response = await client.post('/Users/ChangePassword', data: {
        'PasswordOld': oldPassword,
        'PasswordNew': password,
      });
      var value = response.data!['token'].toString();
      //setValueString(SharedPrefKey.tokenUser, value);
      return value;
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 400 || ex.response?.statusCode == 404) {
        SmartDialog.showToast(LocaleKeys.oldPasswordNotCorrect.tr());
        SmartDialog.dismiss();
      }
      throw Exception(ex.response.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class LoginRepository {
  Dio client;

  LoginRepository({required this.client});

  Future<void> authenticateUser(String userName, String password) async {
    final data = {'userName': userName, 'password': password};
    try {
      final response = await client.post('/api/auth/Login', data: data);

      await setValueString(SharedPrefKey.tokenUser,
          response.data['data']['accessToken'].toString());
      await setValueString(
          SharedPrefKey.refreshToken, response.data['data']['refreshToken']);
      await setValueString(
          SharedPrefKey.idUser, response.data['data']['user']['id'].toString());
      await setValueString(SharedPrefKey.userName,
          response.data['data']['user']['fullName'].toString());
      await setValueString(SharedPrefKey.avatarPath,
          response.data['data']['user']['imageUrl'].toString());
    } on DioError catch (ex) {
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }

  Future<void> createAccount(String userName, String password) async {
    final data = {
      'userName': userName,
      'password': password,
      'confirmPassword': password
    };
    try {
      final response = await client.post('/api/auth/Register', data: data);
    } on DioError catch (ex) {
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }
}

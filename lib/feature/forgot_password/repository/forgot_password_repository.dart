import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ForgotPasswordRepository {
  Dio client;

  ForgotPasswordRepository({required this.client});

  Future<String> checkcaptraFotgotPass(
      String userEnteredCaptchaCode, String userName, String code) async {
    final response =
        await client.post('/Captcha/checkcaptraFotgotPass/', data: {
      'userEnteredCaptchaCode': userEnteredCaptchaCode,
      'captchaId': '',
      'code': code,
      'email': userName
    });
    var message = response.data as String;
    if (message.contains('captchaInvalid')) {
      throw Error();
    }
    return response.data;
  }

  Future<Image> getImageCapcha() async {
    final response = await client.get('/Captcha/GetCaptchaImage',
        options: Options(responseType: ResponseType.bytes));
    final image = Image.memory(response.data);

    return image;
  }

  Future<String> checkcodeFotgotPass(
      String userEnteredCaptchaCode, String userName, String code) async {
    final response = await client.post('/Captcha/resetPassWord/', data: {
      'userEnteredCaptchaCode': userEnteredCaptchaCode,
      'captchaId': '',
      'code': code,
      'email': userName
    });

    return response.data;
  }
}

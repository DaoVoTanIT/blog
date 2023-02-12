import 'dart:async';
import 'package:cmms/common/route/routes.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  late Dio dio = Dio();
  Future<Dio> createAsync() async {
    var respList = await Future.wait([
      getValueString(SharedPrefKey.tokenUser),
      getValueString(SharedPrefKey.domain)
    ]);
    var cookieJar = CookieJar();
    var token = respList[0];
    var domain = respList[1];

    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      print(e.message);
      if ([401].contains(e.response?.statusCode)) {
        final navigationService = GetIt.I<NavigationService>();
        final pref = GetIt.I<SharedPreferences>();
        pref.remove(SharedPrefKey.tokenUser);
        pref.remove(SharedPrefKey.idUser);
        navigationService.pushNamedAndRemoveUntil(
            Routes.login, (route) => false);
      } else if (e.message.contains('Failed host lookup')) {
        final navigationService = GetIt.I<NavigationService>();
        final pref = GetIt.I<SharedPreferences>();
        pref.remove(SharedPrefKey.domain);
        pref.remove(SharedPrefKey.tokenUser);
        pref.remove(SharedPrefKey.idUser);

        var currentRoute = navigationService.currentRoute;
        var isPush = currentRoute != Routes.domain;
        if (isPush) {
          navigationService.pushNamedAndRemoveUntil(
              Routes.domain, (p0) => false);
        }
      }
      return handler.next(e); //continue
    }));
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    dio.options.baseUrl = 'https://$domain';
    return dio;
  }
}

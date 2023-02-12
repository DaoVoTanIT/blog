import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getValueString(String key) async {
  var sharedRefInstance = GetIt.instance<SharedPreferences>();
  final SharedPreferences shared = sharedRefInstance;
  return shared.getString(key);
}

Future<bool> setValueString(String key, String value) async {
  var sharedRefInstance = GetIt.instance<SharedPreferences>();
  final SharedPreferences shared = sharedRefInstance;
  return shared.setString(key, value);
}
Future<bool>removeValueString(String key,) async {
  var sharedRefInstance = GetIt.instance<SharedPreferences>();
  final SharedPreferences shared = sharedRefInstance;
  return shared.remove(key);
}
Future<bool>removeAllValueString(String key) async {
  var sharedRefInstance = GetIt.instance<SharedPreferences>();
  final SharedPreferences shared = sharedRefInstance;
  return shared.remove(key);
}
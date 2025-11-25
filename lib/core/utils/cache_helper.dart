import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../const/app_const.dart';

class CacheHelper {
  static late SharedPreferences sharedPreference;
  static Future<void> init() async {
    sharedPreference = await SharedPreferences.getInstance();
    CacheHelper.getData(key: 'lang') ??
        CacheHelper.saveData(key: StorageKeys.lang, value: 'ar');
  }

  static Future<bool> saveData({
    required final String key,
    required final  value,
  }) async {
    if (value is int) {
      return sharedPreference.setInt(key, value);
    }
    if (value is String) {
      return sharedPreference.setString(key, value);
    }
    if (value is bool) {
      return sharedPreference.setBool(key, value);
    }
    return sharedPreference.setDouble(key, value as double);
  }

  static dynamic getData({required final String key}) =>
      sharedPreference.get(key);

  Future<bool> removeData({required final String key}) async =>
      sharedPreference.remove(key);

  /// save Strings with Secure
  /// exampel secure token and passwords
  static Future<void> setSecuerString({
    required final String key,
    required final String value,
  }) async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// get  Strings with Secure
  /// exampel secure token and passwords
  static Future<String> getSecuerString({required final String key}) async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }
}

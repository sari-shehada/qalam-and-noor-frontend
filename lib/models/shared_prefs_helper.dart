import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  late SharedPreferences spInstance;
  static late SharedPrefsHelper instance;

  static Future<SharedPrefsHelper> init() async {
    instance = SharedPrefsHelper();
    instance.spInstance = await SharedPreferences.getInstance();
    return instance;
  }

  //Login Status
  Future<bool> getLoginStatus() async {
    return spInstance.getBool(SharedPrefsKeys.loginStatusKey) ?? false;
  }

  Future<void> setLoginStatus(bool val) async {
    await spInstance.setBool(SharedPrefsKeys.loginStatusKey, val);
  }
}

class SharedPrefsKeys {
  static String get loginStatusKey => 'isLoggedIn';
}

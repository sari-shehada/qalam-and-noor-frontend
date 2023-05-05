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

  Future<void> saveLoginData(int id) async {
    await setLoginStatus(true);
    await spInstance.setInt(SharedPrefsKeys.employeeIdKey, id);
  }

  Future<int> getLoginData() async {
    return spInstance.getInt(SharedPrefsKeys.employeeIdKey) ?? -1;
  }

  Future<bool> deleteLoginData() async {
    await setLoginStatus(false);
    await spInstance.remove(SharedPrefsKeys.employeeIdKey);
    return true;
  }

  Future<bool> clearAll() async {
    return await spInstance.clear();
  }
}

class SharedPrefsKeys {
  static String get loginStatusKey => 'isLoggedIn';
  static String get employeeIdKey => 'employeeId';
}

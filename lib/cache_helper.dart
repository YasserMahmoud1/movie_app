import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static int() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static putData({required bool isDark}) {
    sharedPreferences.setBool('isDark', isDark);
  }

  static bool? getData() {
    return sharedPreferences.getBool('isDark');
  }
}

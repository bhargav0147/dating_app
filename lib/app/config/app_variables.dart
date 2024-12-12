
import 'package:shared_preferences/shared_preferences.dart';

class AppVariables {
  static const String APPNAME = 'Dating App';
  static const String APIBASEURL = 'https://dating-app-backend-seven.vercel.app/';
  static const double APPTOPSPACING = 45.0;
  static const double APPSIDESPACING = 15.0;
  static const double APPBOTTOMSPACING = 15.0;

  static const String USER_TOKEN_KEY = 'user_token';


  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_TOKEN_KEY, token);
  }


  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_TOKEN_KEY);
  }


  static Future<void> clearUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(USER_TOKEN_KEY);
  }


  static Future<bool> isLoggedIn() async {
    final token = await getUserToken();
    return token != null && token.isNotEmpty;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static void init() async {
    _prefsInstance = await _instance;
  }

  static String getString(String key, [String defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? "0";
  }

  static void setString(String key, String value) async {
    _prefsInstance?.setString(key, value);
  }

  static int getInt(String key, [int defValue]) {

    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }

  static void setInt(String key, int value) async {
    _prefsInstance?.setInt(key, value);
  }

  static bool getBool(String key, [var defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static void setBool(String key, var value) async {
    _prefsInstance?.setBool(key, value);
  }
}
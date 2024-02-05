import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> containsKey(String key) async {
    return _preferences.containsKey(key);
  }

  static Future<dynamic> getValue(String key) async {
    return _preferences.get(key);
  }

  static Future<void> setValue(String key, dynamic value) async {
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  //===================================

  static Future<void> removeKey(String key) async {
    await _preferences.remove(key);
  }

  static Future<void> clear() async {
    await _preferences.clear();
  }
}

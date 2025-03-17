import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (_sharedPreferences == null) {
      await init();
    }
    
    if (value is String) {
      return await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      return await _sharedPreferences!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _sharedPreferences!.setStringList(key, value);
    } else {
      throw Exception('Unsupported data type');
    }
  }

  static Future<dynamic> getData({required String key}) async {
    if (_sharedPreferences == null) {
      await init();
    }
    return _sharedPreferences!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    if (_sharedPreferences == null) {
      await init();
    }
    return await _sharedPreferences!.remove(key);
  }

  static Future<bool> clearAll() async {
    if (_sharedPreferences == null) {
      await init();
    }
    return await _sharedPreferences!.clear();
  }
}
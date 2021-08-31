import 'package:shared_preferences/shared_preferences.dart';

/// In this file, we write all the code needed to store and get data from the
/// local storage using the plugin shared_preferences.

class LocalStorageService {
  static void save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    } else {
      print('Unable to save $value in local');
    }
  }
}

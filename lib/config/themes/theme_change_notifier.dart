import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeChangeNotifier extends ChangeNotifier {
  var box = Hive.box<bool>('settings');

  ThemeChangeNotifier(this.box);

  ThemeMode get themeMode {
    if (box.get('darkMode', defaultValue: false) == true) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  set themeMode(ThemeMode mode) => box
      .put('darkMode', mode != ThemeMode.light)
      .then((_) => notifyListeners());

  bool get isDarkMode => box.get('darkMode', defaultValue: false) == true;
}

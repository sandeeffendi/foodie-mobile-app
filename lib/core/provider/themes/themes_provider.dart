import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemesProvider extends ChangeNotifier {
  static const _key = 'theme_mode';

  ThemeMode _themeMode;

  ThemesProvider({ThemeMode? intialTheme})
    : _themeMode = intialTheme ?? ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_key);

    if (themeIndex != null) {
      _themeMode = ThemeMode.values[themeIndex];
      notifyListeners();
    }
  }

  Future<void> setThemeMode(ThemeMode value) async {
    _themeMode = value;
    // debugPrint(value.toString());
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, value.index);
  }

  Future<void> toggleThemeMode() async {
    if (_themeMode == ThemeMode.light) {
      await setThemeMode(ThemeMode.dark);
    } else {
      await setThemeMode(ThemeMode.light);
    }
    notifyListeners();
  }
}

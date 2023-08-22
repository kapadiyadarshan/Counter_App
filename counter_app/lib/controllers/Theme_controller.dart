import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  bool _isDark = false;

  late SharedPreferences preferences;

  ThemeController({required this.preferences});

  get getValue {
    _isDark = preferences.getBool("theme") ?? false;
    return _isDark;
  }

  void changeTheme() {
    _isDark = !_isDark;
    preferences.setBool("theme", _isDark);
    notifyListeners();
  }
}

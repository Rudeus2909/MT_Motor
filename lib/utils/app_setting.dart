import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  static const String prefDarkMode = 'pref_dark_mode';
  final SharedPreferences _storage;
  
  late bool _isDarkMode;
  bool get isDarkMode => _isDarkMode;

  AppSettings({storage}) : _storage = storage {
    _isDarkMode = _storage.getBool(prefDarkMode) ?? false;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    _storage.setBool(prefDarkMode, _isDarkMode);
  }
}
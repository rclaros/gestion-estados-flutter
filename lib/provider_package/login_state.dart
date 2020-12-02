import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  bool isDarkMode = false;

  void onThemeUpdated(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }
}

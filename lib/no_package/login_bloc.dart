import 'package:flutter/material.dart';

class LoginBloc extends ChangeNotifier {
  bool isDarkMode = false;

  void onThemeUpdated(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }
}

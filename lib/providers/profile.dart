import 'package:flutter/material.dart';
import 'package:fukuro/services/sharedpref.dart';

class Profile with ChangeNotifier {
  bool isDark = sharedPref.getMode();
  bool isLoggedIn = sharedPref.getLoginStatus();

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
    sharedPref.setMode(isDark);
  }

  void changeLoginStatus() {
    isLoggedIn = !isLoggedIn;
    notifyListeners();
    sharedPref.setLoginStatus(isLoggedIn);
  }
}
import 'package:flutter/material.dart';
import 'package:fukuro/services/sharedpref.dart';

class Profile with ChangeNotifier {
  bool isDark = sharedPref.getMode();

  String username = "fukuro";


  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
    
    sharedPref.setMode(isDark);
  }
}
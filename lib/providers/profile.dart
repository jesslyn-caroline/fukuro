import 'package:flutter/material.dart';
import 'package:fukuro/models/user.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

class Profile with ChangeNotifier {
  UsersDb usersDb = UsersDb();

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

  Future <String> login(String email, String password) async {
    UserModel? user = await usersDb.getOne(email);
    if (user == null) return "User not found";
    if (user.password != password) return "Incorrect password";

    changeLoginStatus();
    return "";
  }
}
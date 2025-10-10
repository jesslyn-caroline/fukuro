import 'package:flutter/material.dart';
import 'package:fukuro/models/user.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

class ProfileProvider with ChangeNotifier {
  UsersDb usersDb = UsersDb();

  bool isDark = sharedPref.getMode();
  bool isLoggedIn = sharedPref.getLoginStatus();

  String name = "";

  void changeTheme(value) {
    isDark = value;
    notifyListeners();
    sharedPref.setMode(value);
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

    name = user.name;

    changeLoginStatus();
    return "";
  }
}
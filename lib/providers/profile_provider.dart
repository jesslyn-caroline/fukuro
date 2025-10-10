import 'package:flutter/material.dart';
import 'package:fukuro/models/user.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

class ProfileProvider with ChangeNotifier {
  UsersDb usersDb = UsersDb();

  bool isDark = sharedPref.getMode();
  String userLoggedIn = sharedPref.getLoginStatus();

  UserModel? currentUser;


  void changeTheme(value) {
    isDark = value;
    notifyListeners();
    sharedPref.setMode(value);
  }

  void changeLoginStatus(String name) {
    userLoggedIn = name;

    notifyListeners();
    sharedPref.setLoginStatus(name);
  }

  Future <String> login(String email, String password) async {
    UserModel? user = await usersDb.getOne(email);
    if (user == null) return "User not found";
    if (user.password != password) return "Incorrect password";

    currentUser = user;

    changeLoginStatus(user.name);
    return "";
  }

  Future <void> getUserInfo(String email) async {
    UserModel? user = await usersDb.getOne(email);
    currentUser = user;

    notifyListeners();
  }

  ProfileProvider() {
    getUserInfo(userLoggedIn);
  }
}
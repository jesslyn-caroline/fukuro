import 'package:flutter/material.dart';
import 'package:fukuro/models/user_model.dart';
import 'package:fukuro/respositories/user_respository.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

class ProfileProvider with ChangeNotifier {
  UserRespository userRespository = UserRespository();
  UsersDb usersDb = UsersDb();

  bool isDark = sharedPref.getMode();
  String userLoggedIn = sharedPref.getLoginStatus();

  UserModel? currentUser;


  void changeTheme(value) {
    isDark = value;
    notifyListeners();
    sharedPref.setMode(value);
  }

  void changeLoginStatus(String email) {
    userLoggedIn = email;

    notifyListeners();
    sharedPref.setLoginStatus(email);
  }

  Future <String> login(String email, String password) async {
    Map <String, dynamic> data = await userRespository.fetch(email, password);
    String message = data["message"];
    UserModel? user = data["user"];

    if (user == null) return message;

    currentUser = user;
    changeLoginStatus(user.email);

    usersDb.insert(user.toJson());

    return message;
  }

  Future <void> getUserInfo(String email) async {
    UserModel? user = await usersDb.getOne(email);
    currentUser = user;
    notifyListeners();
  }

  Future <void> updateUserInfo(Map <String, dynamic> data) async {
    data["email"] = currentUser?.email;

    await usersDb.updateOne(data);
    getUserInfo(userLoggedIn);

    await userRespository.update(data);
  }

  ProfileProvider() {
    userLoggedIn = sharedPref.getLoginStatus();
    getUserInfo(userLoggedIn);
  }
}
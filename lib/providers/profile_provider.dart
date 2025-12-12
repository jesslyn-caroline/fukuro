import 'package:flutter/material.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/models/user_model.dart';
import 'package:fukuro/respositories/user_respository.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ProfileProvider with ChangeNotifier {
  UserRespository userRespository = UserRespository();
  UsersDb usersDb = UsersDb();
  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();

  bool isDark = sharedPref.getMode();

  User? user = FirebaseAuth.instance.currentUser;

  void changeTheme(value) {
    isDark = value;
    notifyListeners();
    sharedPref.setMode(value);
  }

  Future<String> login(String email, String password) async {
    String msg = "";
    msg = await firebaseAuthenticationService.login(email, password);

    if (msg != "") return msg;

    user = FirebaseAuth.instance.currentUser;

    usersDb.insert({
      "email" : user!.email,
      "name" : user!.displayName,
      "profile" : user!.photoURL
    });

    notifyListeners();

    return msg;
  }

  Future<void> updateUserInfo (Map <String, dynamic> data, String toBeChanged) async {
    switch (toBeChanged) {
      case "displayName": await firebaseAuthenticationService.changeDisplayName(data["name"]);
      case "profilePic": await firebaseAuthenticationService.changeProfilePic(data["profile"]);
      case "password": await firebaseAuthenticationService.changePassword(data["oldPassword"], data["password"]);
    }
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();

    print(user);

    data["email"] = user!.email;

    await usersDb.updateOne(data);

    
  }
}
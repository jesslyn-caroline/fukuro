import 'package:flutter/material.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ProfileProvider with ChangeNotifier {
  UsersDb usersDb = UsersDb();
  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreUser firestoreUser = FirestoreUser();

  bool isDark = sharedPref.getMode();

  User? user = FirebaseAuth.instance.currentUser;
  UserInfoModel? userInfo;

  String selectedLang = sharedPref.getSelectedLang() ?? 'en';

  void changeLang (langCode) {
    selectedLang = langCode;
    notifyListeners();
    sharedPref.setSelectedLang(langCode);
  }

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

  Future<void> updateUserProfile (Map <String, dynamic> data, String toBeChanged) async {
    switch (toBeChanged) {
      case "displayName": await firebaseAuthenticationService.changeDisplayName(data["name"]);
      case "profilePic": await firebaseAuthenticationService.changeProfilePic(data["profile"]);
      case "password": await firebaseAuthenticationService.changePassword(data["oldPassword"], data["password"]);
    }
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();

    if (toBeChanged == "password") return;

    data["email"] = user!.email;
    await usersDb.updateOne(data);
  }

  Future <void> updateUserInfo (Map <String, dynamic> data) async {
    data["uid"] = user!.uid;
    await firestoreUser.updateOne(data);
    getUserInfo();
  }

  Future <void> getUserInfo () async {
    userInfo = await firestoreUser.getOne(user!.uid);
    if (userInfo!.streakQuiz != 0 && DateTime.parse(userInfo!.lastQuizTaken).compareTo(DateTime.now()).abs() > 1) {
      updateUserInfo({ "streakQuiz" : 0 });
      return;
    }
    notifyListeners();
  }

  ProfileProvider() {
    getUserInfo();
  }
}
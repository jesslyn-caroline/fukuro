import 'package:flutter/material.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/permissions/internet_permission.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

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

  // Future<void> login() async {
  //   user = FirebaseAuth.instance.currentUser;
  //   userInfo = await usersDb.getOne(user!.uid);

  //   notifyListeners();
  // }

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
    await usersDb.updateByUID(data);
  }

  Future <void> updateUserInfo (Map <String, dynamic> data) async {
    data["uid"] = user!.uid;
    await firestoreUser.updateByUID(data);
    await usersDb.updateByUID(data);
    getUserInfo();
  }

  Future <void> getUserInfo () async {
    user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    userInfo = await usersDb.getByUID(user!.uid);

    String msg = await isInternetConnected();
    if (msg != "") {
      notifyListeners();
      return;
    }
    

    userInfo = await firestoreUser.getByUID(user!.uid);

    DateTime prev = DateTime.parse(userInfo!.lastQuizTaken.toString());
    DateTime now = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
    int diff = now.compareTo(prev).abs();

    print("PREV : $prev");
    print("NOW : $now");
    print("DIFF : $diff");

    usersDb.getAll();



    // if (userInfo!.streakQuiz != 0 && diff > 0) {
    //   updateUserInfo({ "streakQuiz" : 0 });
    //   return;
    // }
    userInfo = await firestoreUser.getByUID(user!.uid);

    notifyListeners();
  }

  // ProfileProvider() {
  //   getUserInfo();
  // }
}
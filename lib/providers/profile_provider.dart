import 'package:flutter/material.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fukuro/utils/get_user_info.dart';

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

  Future <void> setUserInfo() async {
    user = FirebaseAuth.instance.currentUser;
    userInfo = await getUserInfo();
    notifyListeners();
  }
}
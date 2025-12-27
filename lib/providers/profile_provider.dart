import 'package:flutter/material.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/services/sharedpref.dart';
import 'package:fukuro/services/usersdb.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fukuro/utils/get_user_info.dart';
// import 'package:fukuro/utils/get_user_info.dart';

class ProfileProvider with ChangeNotifier {
  UsersDb usersDb = UsersDb();
  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreUser firestoreUser = FirestoreUser();

  bool isDark = sharedPref.getMode();

  User? user = FirebaseAuth.instance.currentUser;
  UserInfoModel? userInfo;

  String selectedLang = sharedPref.getSelectedLang() ?? 'en';
  DateTime? reminderTime = sharedPref.getReminderTime() != null? DateTime.parse(sharedPref.getReminderTime()!) : null;

  void setUserInfo(String? lastQuizTaken, int? streakQuiz, int? point, int? key) {
    userInfo!.lastQuizTaken = lastQuizTaken ?? userInfo!.lastQuizTaken;
    userInfo!.streakQuiz = streakQuiz ?? userInfo!.streakQuiz;
    userInfo!.point = point ?? userInfo!.point;
    userInfo!.key = key ?? userInfo!.key; 
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

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

  void changeReminderTime(DateTime? time) {
    reminderTime = time;
    notifyListeners();
    if (time == null) sharedPref.delReminderTime();
    else sharedPref.setReminderTime(time);
  }

  Future <void> initUserInfo() async {
    user = FirebaseAuth.instance.currentUser;
    userInfo = await getUserInfo();
    notifyListeners();
  }
}
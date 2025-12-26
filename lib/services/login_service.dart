import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/permissions/internet_permission.dart';
import 'package:fukuro/services/usersdb.dart';

class LoginService {
  FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreUser _firestoreUser = FirestoreUser();
  UsersDb usersDb = UsersDb();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future <String> login () async {
    String msg = "";

    msg = await isInternetConnected();
    if (msg != "") return msg;

    msg = await _firebaseAuthenticationService.login(emailC.text, passwordC.text);
    if (msg != "") return msg;

    User currentUser = FirebaseAuth.instance.currentUser!;

    UserInfoModel? user = await usersDb.getByUID(currentUser.uid);
    bool isFound = user == null ? false : true;

    if (!isFound) usersDb.insert(currentUser.uid);
    else {
      UserInfoModel userInfo = await _firestoreUser.getByUID(currentUser.uid);
      Map <String, dynamic> data = UserInfoModel(
        uid: userInfo.uid, 
        lastQuizTaken: userInfo.lastQuizTaken, 
        streakQuiz: userInfo.streakQuiz, 
        point: userInfo.point
      ).toJson();
      
      usersDb.updateByUID(currentUser.uid, data);
    }

    return msg;
  }
}
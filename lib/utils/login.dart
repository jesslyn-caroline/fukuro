import 'package:firebase_auth/firebase_auth.dart';

import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/firebase/firebase_authentication.dart';
import 'package:fukuro/services/usersdb.dart';
import 'package:fukuro/permissions/internet_permission.dart';

Future <String> login (String email, String password) async {
  FirebaseAuthenticationService firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreUser firestoreUser = FirestoreUser();
  UsersDb usersDb = UsersDb();

  String msg = "";

  msg = await isInternetConnected();
  if (msg != "") return msg;
  else msg = await firebaseAuthenticationService.login(email, password);

  if (msg != "") return msg;

  User currentUser = FirebaseAuth.instance.currentUser!;

  UserInfoModel? user = await usersDb.getByUID(currentUser.uid);
  bool isFound = user == null ? false : true;

  if (!isFound) usersDb.insert(currentUser.uid);
  else {
    UserInfoModel userInfo = await firestoreUser.getByUID(currentUser.uid);
    Map <String, dynamic> data = UserInfoModel(
      uid: userInfo.uid, 
      lastQuizTaken: userInfo.lastQuizTaken, 
      streakQuiz: userInfo.streakQuiz, 
      point: userInfo.point
    ).toJson();
    
    usersDb.updateByUID(data);
  }

  return msg;
}
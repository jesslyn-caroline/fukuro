import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'package:fukuro/firebase/firebase_firestore/firestore_user.dart';
import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/permissions/internet_permission.dart';
import 'package:fukuro/services/usersdb.dart';

Future <UserInfoModel> getUserInfo () async {
  FirestoreUser _firestoreUser = FirestoreUser();
  UsersDb usersDb = UsersDb();

  User? user = FirebaseAuth.instance.currentUser;
  UserInfoModel? userInfo = await usersDb.getByUID( user!.uid );

  String msg;

  msg = await isInternetConnected();
  if (msg != "") return userInfo!;

  userInfo = await _firestoreUser.getByUID(user.uid);

  DateTime prev = DateTime.parse(userInfo.lastQuizTaken);
  DateTime now = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
  int diff = now.difference(prev).inDays;
  // int diff = now.compareTo(prev).abs();

  if (diff > 1) {
    await _firestoreUser.updateByUID({
      _firestoreUser.UID : userInfo.uid,
      _firestoreUser.STREAKQUIZ : 0
    });

    await usersDb.updateByUID({
      usersDb.UID : userInfo.uid,
      usersDb.STREAKQUIZ : 0
    });

    userInfo.streakQuiz = 0;
  }

  return userInfo;
}
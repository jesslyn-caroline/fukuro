import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fukuro/models/userInfo_model.dart';

class FirestoreUser {
  String docs = "users";
  String UID = "uid";
  String LASTQUIZTAKEN = "lastQuizTaken";
  String STREAKQUIZ = "streakQuiz";
  String POINT = "point";
  String KEY = "key";

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future <void> postOne(String uid) async {
    Map <String, dynamic> data = {
      UID : uid, 
      LASTQUIZTAKEN : DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 2))),
      STREAKQUIZ : 0,
      POINT : 0,
      KEY : 0
    };
    await db.collection(docs).doc(uid).set(data);
  }

  Future <UserInfoModel> getByUID(String uid) async {
    var res = await db.collection(docs).doc(uid).get();
    UserInfoModel userInfo = UserInfoModel.fromJson(res.data()!);
    return userInfo;
  }

  Future <void> updateByUID(String uid, Map <String, dynamic> data) async {
    await db.collection(docs).doc(uid).update(data);
  }
}
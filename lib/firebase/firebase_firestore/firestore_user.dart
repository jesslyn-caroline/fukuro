import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fukuro/models/userInfo_model.dart';

class FirestoreUser {
  String docs = "users";
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future <void> postOne(String uid) async {
    Map <String, dynamic> data = {
      "uid" : uid, 
      "lastQuizTaken" : DateTime.now().subtract(Duration(days: 2)).toString(),
      "streakQuiz" : 0
    };
    await db.collection(docs).doc(uid).set(data);
  }

  Future <UserInfoModel> getOne(String uid) async {
    var res = await db.collection(docs).doc(uid).get();
    UserInfoModel userInfo = UserInfoModel.fromJson(res.data()!);
    return userInfo;
  }

  Future <void> updateOne(Map <String, dynamic> data) async {
    await db.collection(docs).doc(data["uid"]).update(data);
  }
}
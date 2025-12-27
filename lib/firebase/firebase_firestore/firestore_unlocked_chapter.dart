import 'package:fukuro/models/unlocked_chapter_model.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fukuro/models/userInfo_model.dart';

class FirestoreUnlockedChapter {
  String docs = "unlockedChapter";
  String UID = "uid";
  String CHAPTERID = "courseId";

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future <void> postOne(String uid, String chapterId) async {
    Map <String, dynamic> data = {
      UID : uid, 
      CHAPTERID : chapterId
    };
    await db.collection(docs).add(data);
  }

  Future <Map <String, List <int>>> getByUID(String uid) async {
    var res = await db.collection(docs).where(UID, isEqualTo: uid).get();
    Map <String, List <int>> data = {};

    for (var ch in res.docs) {
      List <String> chapterId = ch[ CHAPTERID ].split('_');
      data[chapterId[0]] = [ ... data[chapterId[0]] ?? [] , int.parse(chapterId[1]) ];
      data[chapterId[0]]!.sort((a, b) => a.compareTo(b));
    }
    
    return data;
  }
}
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'package:fukuro/models/userInfo_model.dart';
import 'package:fukuro/services/dbservice.dart';

class UsersDb {
  String TABLE = "users";
  String UID = "uid";
  String POINT = "point";
  String STREAKQUIZ = "streakQuiz";
  String LASTQUIZTAKEN = "lastQuizTaken";

  DBService dbService = DBService();

  createTableUsers(db) async {
    // await db.execute('DROP TABLE IF EXISTS $TABLE');
    await db.execute(
      '''
        CREATE TABLE IF NOT EXISTS $TABLE (
          $UID TEXT PRIMARY KEY,
          $POINT INTEGER NOT NULL DEFAULT 0,
          $STREAKQUIZ INTEGER NOT NULL DEFAULT 0,
          $LASTQUIZTAKEN TEXT NOT NULL
        )
      '''
    );
  }

  void insert(String uid) async {
    Map <String, dynamic> data = { 
      UID: uid, 
      LASTQUIZTAKEN : DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 2))),
    };
    Database db = await dbService.getDatabase();
    db.insert(TABLE, data);
  }

  Future <UserInfoModel?> getByUID(String uid) async {
    try {
      Database db = await dbService.getDatabase();
      var data = await db.query(TABLE, where: "$UID = ?", whereArgs: [uid]);

      UserInfoModel user = UserInfoModel.fromJson(data.first);

      return user;
    } catch (err) {
      return null;
    }   
  }

  Future <void> getAll() async {
    Database db = await dbService.getDatabase();
    var data = await db.query(TABLE);
    print(data);
  }

  Future <void> updateByUID(Map <String, dynamic> data) async {
    Database db = await dbService.getDatabase();
    db.update(TABLE, data, where: "$UID = ?", whereArgs: [data[UID]]);
  }
}
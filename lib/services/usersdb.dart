import 'package:sqflite/sqflite.dart';

import 'package:fukuro/models/user_model.dart';
import 'package:fukuro/services/dbservice.dart';


class UsersDb {
  String TABLE = "users";
  String ID = "id";
  String NAME = "name";
  String PASSWORD = "password";
  String EMAIL = "email";
  String PROFILE = "profile";

  DBService dbService = DBService();


  createTableUsers(db) async {
    await db.execute(
      '''
        CREATE TABLE IF NOT EXISTS $TABLE (
          $ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $NAME TEXT NOT NULL,
          $EMAIL TEXT NOT NULL UNIQUE,
          $PROFILE TEXT NOT NULL
        )
      '''
    );
  }

  void insert(Map<String, dynamic> data) async {
    Database db = await dbService.getDatabase();
    db.insert(TABLE, data);
  }

  Future <UserModel?> getOne(String email) async {
    try {
      Database db = await dbService.getDatabase();
      var data = await db.query(TABLE, where: "$EMAIL = ?", whereArgs: [email]);
      UserModel user = UserModel.fromJson(data[0]);

      return user;
    } catch (err) {
      return null;
    }   
  }

  Future <void> updateOne(Map <String, dynamic> data) async {
    Database db = await dbService.getDatabase();
    db.update(TABLE, data, where: "$EMAIL = ?", whereArgs: [data["email"]]);
  }
}
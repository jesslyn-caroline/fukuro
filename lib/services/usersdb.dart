import 'package:fukuro/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fukuro/services/dbservice.dart';

class UsersDb {
  String TABLE = "users";
  String ID = "id";
  String NAME = "name";
  String EMAIL = "email";
  String PASSWORD = "password";
  String PROFILE = "profile";

  DBService dbService = DBService();


  createTableUsers(db) async {
    // await db.execute('DROP TABLE IF EXISTS $TABLE');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $TABLE (
        $ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $NAME TEXT NOT NULL,
        $EMAIL TEXT NOT NULL UNIQUE,
        $PASSWORD TEXT NOT NULL,
        $PROFILE TEXT NOT NULL DEFAULT "pp-bear.png"
      )
    ''');
  }

  void insert(Map<String, dynamic> data) async {
    Database db = await dbService.getDatabase();
    db.insert(TABLE, data);
  }

  Future <UserModel?> getOne(String email) async {
    try {
      Database db = await dbService.getDatabase();
      var data = await db.query(TABLE, where: "$EMAIL = ?", whereArgs: [email]);
      UserModel user = UserModel(
        id: data.first['id'].toString(),
        name: data.first['name'].toString(),
        email: data.first['email'].toString(),
        password: data.first['password'].toString(),
        profile: data.first['profile'].toString()
      );

      return user;
    } catch (err) {
      return null;
    }   
  }

  Future <void> updateOne(Map <String, dynamic> data) async {
    Database db = await dbService.getDatabase();
    db.update(TABLE, data, where: "$EMAIL = ?", whereArgs: [data['email']]);
  }
}
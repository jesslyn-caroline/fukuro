import 'package:fukuro/services/usersdb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService {
  Database? database;

  getDatabase() async {
    if (database != null) return database;

    database = await initDatabase();
    createTables(database);
    return database;
  }

  Future <Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'users.db');

    return await openDatabase(path, version: 1);
  }

  void createTables(db) {
    UsersDb usersDb = UsersDb();
    usersDb.createTableUsers(db);
  }
}
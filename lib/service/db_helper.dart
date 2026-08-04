import 'dart:io';
import 'package:authentication/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;

  DbHelper.createObject();

  static DbHelper _dbHelper = DbHelper.createObject();

  factory DbHelper() {
    return _dbHelper;
  }
  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}/users.db";
    var authentication = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(""" CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullname TEXT NOT NULL,
        username TEXT UNIQUE,
        password TEXT NOT NULL
        )""");
      },
    );
    return authentication;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database!;
  }

  Future<bool> register(User user) async {
    Database db = await database;
    final result = await db.query(
      "users",
      where: "username = ?",
      whereArgs: [user.username],
    );
    if (result.isNotEmpty) {
      return false;
    }

    await db.insert("users", user.toJson());
    return true;
  }

  Future<bool> login(String username, String password) async {
    Database db = await database;
    final result = await db.query(
      "users",
      where: "username = ? AND password = ?",
      whereArgs: [username, password],
    );
    if (result.isEmpty) {
      return false;
    }
    return true;
  }
}

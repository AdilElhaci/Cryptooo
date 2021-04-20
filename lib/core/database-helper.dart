import 'dart:async';

import 'package:cryptoo/core/models/weekly-crpyto.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  static final _databaseName = 'ahi.db';

  static final tableWeeklyCrypto = 'weekly_crypto';

  static final columnId = 'id';
  static final columnSymbol = 'symbol';
  static final columnPrice = 'price';
  static final columnDate = 'date';

//for Singleton
  DatabaseHelper._internal();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      return _databaseHelper = DatabaseHelper._internal();
    } else {
      return _databaseHelper;
    }
  }

  Future<Database> getDatabase() async {
    _database ??= await _initialDatabase();

    if (_database != null) {
      _database = await _initialDatabase();
    }

    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initialDatabase() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    var path = join(await getDatabasesPath(), _databaseName);

    var txDB = await openDatabase(path, version: 1, onCreate: _createDB);

    return txDB;
  }

  // SQL code to create the database table
  FutureOr _createDB(Database db, int version) async {
    var queryWeeklyCrypto =
        'CREATE TABLE $tableWeeklyCrypto ($columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnSymbol TEXT NOT NULL,$columnPrice REAL NOT NULL,$columnDate TEXT NOT NULL)';

    await db.execute(queryWeeklyCrypto);
  }

  Future<int> addCrypto(WeeklyCryptoModel item) async {
    var db = await getDatabase();
    var result = db.insert(tableWeeklyCrypto, item.toJson());
    return result;
  }

  Future<List<Map<String, dynamic>>> allData() async {
    var db = await getDatabase();
    var result = db.query(tableWeeklyCrypto, orderBy: '$columnId DESC');
    return result;
  }

  Future<int> updateCrypto(WeeklyCryptoModel item) async {
    var db = await getDatabase();
    var result = db.update(tableWeeklyCrypto, item.toJson(),
        where: '$columnId = ? ', whereArgs: [item.id]);
    return result;
  }

  Future<int> deleteCrypto(int id) async {
    var db = await getDatabase();
    return await db
        .delete(tableWeeklyCrypto, where: '$columnId = ?', whereArgs: [id]);
  }
}

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/weekly-crpyto.model.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  static final _databaseName = 'crypto';
  static final _tableName = 'weekly_prices';
  static final _columnId = 'id';
  static final _columnSymbol = 'symbol';
  static final _columnMon = 'mon';
  static final _columnTues = 'tues';
  static final _columnWed = 'wed';
  static final _columnThur = 'thur';
  static final _columnFrid = 'frid';
  static final _columnSat = 'sat';
  static final _columnSun = 'sun';

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
    var queryWeeklyCrypto = '''
        CREATE TABLE $_tableName (
        $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $_columnSymbol TEXT NOT NULL,
        $_columnMon REAL NOT NULL,
        $_columnTues REAL NOT NULL,
        $_columnWed REAL NOT NULL,
        $_columnThur REAL NOT NULL,
        $_columnFrid REAL NOT NULL,
        $_columnSat REAL NOT NULL,
        $_columnSun REAL NOT NULL,
        )
        ''';

    await _database.execute(queryWeeklyCrypto);
  }

  Future<int> addCrypto(WeeklyCryptoModel item) async {
    // var db = await getDatabase();
    // var result = db.insert(tableWeeklyCrypto, item.toJson());
    // return result;
  }

  Future<List<Map<String, dynamic>>> allData() async {
    // var db = await getDatabase();
    // var result = db.query(tableWeeklyCrypto, orderBy: '$columnId DESC');
    // return result;
  }

  Future<int> updateCrypto(WeeklyCryptoModel item) async {
    // var db = await getDatabase();
    // var result = db.update(tableWeeklyCrypto, item.toJson(),
    //     where: '$columnId = ? ', whereArgs: [item.id]);
    // return result;
  }

  Future<int> deleteCrypto(int id) async {
    // var db = await getDatabase();
    // return await db
    //     .delete(tableWeeklyCrypto, where: '$columnId = ?', whereArgs: [id]);
  }
}

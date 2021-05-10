// import 'dart:io';

// import 'package:sqflite/sqflite.dart';
// import 'models/weekly-crpyto.model.dart';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static const String DATABASE_NAME = "crypto.db";
//   static const int DATABASE_VERSION = 1;

//   static Database _db;

//   static final DatabaseHelper _instance = new DatabaseHelper.internal();
//   DatabaseHelper.internal();
//   factory DatabaseHelper() => _instance;

//   static final _tableName = 'weekly_prices';
//   static final _columnId = 'id';
//   static final _columnSymbol = 'symbol';
//   static final _columnPrice = 'price';
//   static final _columnDate = 'date';

//   Future<Database> get database async {
//     if (_db != null) {
//       return _db;
//     }

//     _db = await initDb();
//     return _db;
//   }

//   // this opens the database (and creates it if it doesn't exist)

//   initDb() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, DATABASE_NAME);
//     return await openDatabase(path, version: DATABASE_VERSION, onCreate: _createDB);
//   }

//   // SQL code to create the database table
//   Future _createDB(Database db, int version) async {
//     var queryWeeklyCrypto =
//         'CREATE TABLE $_tableName ($_columnId INTEGER PRIMARY KEY AUTOINCREMENT,$_columnSymbol TEXT NOT NULL,$_columnDate TEXT NOT NULL,$_columnMon REAL NOT NULL,$_columnTues REAL NOT NULL,$_columnWed REAL NOT NULL,$_columnThur REAL NOT NULL,$_columnFrid REAL NOT NULL,$_columnSat REAL NOT NULL,$_columnSun REAL NOT NULL)';
//     await db.execute(queryWeeklyCrypto);
//   }

//   Future<List<Map<String, dynamic>>> allData() async {
//     var db = _db;
//     var result = db.query(_tableName, orderBy: '$_columnId DESC');
//     return result;
//   }

//   Future<int> insertCrypto(WeeklyCryptoModel item) async {
//     if (_db == null) {
//       _db = await initDb();
//     }
//     var db = _db;
//     var result = db.insert(_tableName, item.toJson());
//     return result;
//   }

//   Future<int> updateCrypto(WeeklyCryptoModel item) async {
//     var db = _db;
//     var result = db.update(_tableName, item.toJson(), where: '$_columnId = ? ', whereArgs: [item.id]);
//     return result;
//   }

//   Future<int> deleteCrypto(int id) async {
//     var db = _db;
//     return await db.delete(_tableName, where: '$_columnId = ?', whereArgs: [id]);
//   }
// }

import 'dart:async';

import 'package:cryptoo/core/models/weekly-crpyto.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  static final _databaseName = 'crypto.db';

  static final tableWeeklyCrypto = 'weekly_crypto';

  static final columnId = 'id';
  static final columnSymbol = 'symbol';
  static final columnPrice = 'price';
  static final columnDate = 'date';

//for Singleton

  DatabaseHelper._privateConstructor();
  static DatabaseHelper get instance => _instance;
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      return _databaseHelper = DatabaseHelper._privateConstructor();
    } else {
      return _databaseHelper;
    }
  }

  Future<Database> getDatabase() async {
    _database ??= await _initialDatabase();

    if (_database != null) {
      int dbVersion = await _database.getVersion();
      if (dbVersion != 3) {
        print('database version has been changed');
        _database = await _initialDatabase();
      }
    }
    print('/////////////////');
    print('Successfuly');
    print('/////////////////');

    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initialDatabase() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    var path = join(await getDatabasesPath(), _databaseName);

    var txDB = await openDatabase(path, version: 3, onCreate: _createDB);

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
    var result = db.update(tableWeeklyCrypto, item.toJson(), where: '$columnId = ? ', whereArgs: [item.id]);
    return result;
  }

  Future<int> deleteCrypto(int id) async {
    var db = await getDatabase();
    return await db.delete(tableWeeklyCrypto, where: '$columnId = ?', whereArgs: [id]);
  }
}

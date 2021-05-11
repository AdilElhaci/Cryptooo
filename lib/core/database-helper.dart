import 'dart:async';
import 'dart:io';

import 'package:cryptoo/core/models/weekly-crpyto.model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
    if (_database != null) {
      print('/////////////data base mevcut///////////');
      return _database;
    }

    _database = await _initialDatabase();
    return _database;
  }

  Future<Database> _initialDatabase() async {
    print('CCCCCCCCCCCCEEEEEEEEEAAAAAAAATTTTTTTTTTEEED');
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _databaseName);
    var txDB = await openDatabase(path, version: 1, onCreate: _createDB);
    return txDB;
  }

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

import 'dart:async';
import 'dart:convert';
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
      return _database;
    }

    _database = await _initialDatabase();
    return _database;
  }

  Future<Database> _initialDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _databaseName);
    var txDB = await openDatabase(path, version: 1, onCreate: _createDB);
    return txDB;
  }

  FutureOr _createDB(Database db, int version) async {
    var queryWeeklyCrypto =
        'CREATE TABLE $tableWeeklyCrypto ($columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,$columnSymbol TEXT NOT NULL,$columnPrice REAL NOT NULL,$columnDate TEXT NOT NULL)';

    await db.execute(queryWeeklyCrypto);
  }

  Future<int> addCrypto(WeeklyCryptoModel item) async {
    var db = await getDatabase();

    var result = db.insert(tableWeeklyCrypto, item.toJson());
    return result;
  }

  Future<List<Map<String, dynamic>>> allData() async {
    var db = await getDatabase();
    var result = db.query(tableWeeklyCrypto, orderBy: '$columnId ASC');
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

  Future<List<WeeklyCryptoModel>> getCryptoPrices(String symbol) async {
    var db = await getDatabase();

    List<Map> maps = await db.query(tableWeeklyCrypto, where: '$columnSymbol = ?', whereArgs: [symbol], orderBy: '$columnId DESC');
    List<WeeklyCryptoModel> list = [];

    for (var i = 0; i < maps.length; i++) {
      list.add(WeeklyCryptoModel.fromJson(maps[i]));
    }

    return list;
  }
}

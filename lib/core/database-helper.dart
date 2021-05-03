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
//   static final _columnDate = 'date';
//   static final _columnMon = 'mon';
//   static final _columnTues = 'tues';
//   static final _columnWed = 'wed';
//   static final _columnThur = 'thur';
//   static final _columnFrid = 'frid';
//   static final _columnSat = 'sat';
//   static final _columnSun = 'sun';

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

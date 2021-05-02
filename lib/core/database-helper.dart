// import 'package:sqflite/sqflite.dart';
// import 'models/weekly-crpyto.model.dart';

// class DatabaseHelper {
//   static DatabaseHelper _databaseHelper;

//   static Database _database;

//   static final _databaseVersion = 1;
//   static final _databaseName = 'crypto';
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

// //for Singleton
//   DatabaseHelper._internal();

//   factory DatabaseHelper() {
//     if (_databaseHelper == null) {
//       //   return _databaseHelper = DatabaseHelper._internal();
//     } else {
//       return _databaseHelper;
//     }
//   }

//   Future<Database> getDatabase() async {
//     _database ??= await _initialDatabase();
//     if (_database != null) {
//       _database = await _initialDatabase();
//     }
//     return _database;
//   }

//   // this opens the database (and creates it if it doesn't exist)
//   Future<Database> _initialDatabase() async {
//     // Directory directory = await getApplicationDocumentsDirectory();

//     var txDB = await openDatabase(_databaseName,
//         version: _databaseVersion, onCreate: _createDB);
//     return txDB;
//   }

//   Future<void> insert(WeeklyCryptoModel model) async {
//     if (_database != null) {
//       _database = await _initialDatabase();
//     }
//     return await _database.insert(_tableName, model.toJson());
//   }

//   // SQL code to create the database table
//   Future _createDB(Database db, int version) async {
//     var queryWeeklyCrypto = '''
//         CREATE TABLE $_tableName (
//         $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//         $_columnSymbol TEXT NOT NULL,
//         $_columnDate TEXT NOT NULL,
//         $_columnMon REAL NOT NULL,
//         $_columnTues REAL NOT NULL,
//         $_columnWed REAL NOT NULL,
//         $_columnThur REAL NOT NULL,
//         $_columnFrid REAL NOT NULL,
//         $_columnSat REAL NOT NULL,
//         $_columnSun REAL NOT NULL,
//         );
//     ''';
//     await db.execute(queryWeeklyCrypto);
//   }

//   Future<int> addCrypto(WeeklyCryptoModel item) async {
//     var db = await getDatabase();
//     var result = db.insert(_tableName, item.toJson());
//     return result;
//   }

//   Future<List<Map<String, dynamic>>> allData() async {
//     var db = await getDatabase();
//     var result = db.query(_tableName, orderBy: '$_columnId DESC');
//     return result;
//   }

//   Future<int> updateCrypto(WeeklyCryptoModel item) async {
//     var db = await getDatabase();
//     var result = db.update(_tableName, item.toJson(),
//         where: '$_columnId = ? ', whereArgs: [item.id]);
//     return result;
//   }

//   Future<int> deleteCrypto(int id) async {
//     var db = await getDatabase();
//     return await db
//         .delete(_tableName, where: '$_columnId = ?', whereArgs: [id]);
//   }
// }

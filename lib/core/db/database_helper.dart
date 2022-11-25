import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../common/database_request.dart';
import '../../data/model/role.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  DatabaseHelper._instance();

  late final Directory _appDocumentDirectory;

  late final String _pathDB;
  late final Database database;
  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'furniture_shop.db');
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {

      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      database= await databaseFactory.openDatabase(_pathDB,   
        options: OpenDatabaseOptions(
             version: 1,
             onCreate: (db, version) {onCreateTable(db);},
             onUpgrade: ((db, oldVersion, newVersion) async {await onUpdateTable(db);})
          ));
    } else {
      database =
          await openDatabase(_pathDB, version: 1, onCreate: (db, version) {
        onCreateTable(db);
      }, onUpgrade: ((db, oldVersion, newVersion) async {
        await onUpdateTable(db);
      }));
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var table = await db.rawQuery('SELECT name FROM sqlite_master');
    for (var i = 0; i < DatabaseRequest.tableList.reversed.length; i++) {
      if (table
          .where((element) => element['name'] == DatabaseRequest.tableList[i])
          .isNotEmpty) {
        await db
            .execute(DatabaseRequest.deleteTable(DatabaseRequest.tableList[i]));
      }
    }
    for (var element in DatabaseRequest.tableCreateList) {
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DatabaseRequest.tableList.length; i++) {
      db.execute(DatabaseRequest.tableCreateList[i]);
    }
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DatabaseRequest.tableRole, Role(id:1, name: 'Administrator').toMap());
      db.insert(DatabaseRequest.tableRole, Role(id:2, name: 'User').toMap());
    } on DatabaseException catch (e) {
      print(e.getResultCode());
    }
  }

  Future<void> onDropDataBase() async {
    database.close();
    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    databaseFactory = databaseFactoryFfi; 
    databaseFactory.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}

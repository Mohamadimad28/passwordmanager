import 'dart:io';
import 'package:passwordmanager/models/password_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  static const String tableName = "passwordTable";
  static const String passwordIdColumn = "id";
  static const String passwordNameColumn = "name";
  static const String passwordUrlColumn = "urlImage";
  static const String passwordEmailColumn = "email";
  static const String passwordnoteColumn = "note";
  static const String passwordPassWordColumn = "password";

  late Database database;

  initilizaDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/password.db';
    database = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(
        'CREATE TABLE $tableName ($passwordIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, $passwordNameColumn TEXT, $passwordEmailColumn TEXT,$passwordUrlColumn TEXT , $passwordPassWordColumn TEXT , $passwordnoteColumn TEXT)',
      );
    });
  }

  addNewPass(Password password) async {
    int rowIndex = await database.insert(tableName, password.toMap());
    print('row $rowIndex has been inserted');
  }

  Future<List<Password>> getAllPassword() async {
    List<Map<String, Object?>> results = await database.query(tableName);
    List<Password> password = results.map((e) => Password.fromMap(e)).toList();
    return password;
  }

  Future<bool> deletePassword(int taskId) async {
    int deletedRowsCount =
        await database.delete(tableName, where: 'id=?', whereArgs: [taskId]);
    return deletedRowsCount > 0 ? true : false;
  }

  Future<bool> updatePassword(Password password) async {
    int updatedRowsCount = await database.update(tableName, password.toMap(),
        where: 'id=?', whereArgs: [password.id]);
    return updatedRowsCount > 0 ? true : false;
  }

  getAllTables() async {
    final tables =
        await database.rawQuery('SELECT * FROM tasks ORDER BY name;');
    print(tables.toString());
  }
}

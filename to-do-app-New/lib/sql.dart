import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT, isChecked INTEGER)',
        );
      },
    );
  }

  Future<void> insertTask(String task) async {
    final db = await database;
    await db.insert('tasks', {'task': task, 'isChecked': 0});
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTask(int id, String task) async {
    final db = await database;
    await db.update('tasks', {'task': task}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTaskCheck(int id, int isChecked) async {
    final db = await database;
    await db.update('tasks', {'isChecked': isChecked},
        where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return await db.query('tasks');
  }
}

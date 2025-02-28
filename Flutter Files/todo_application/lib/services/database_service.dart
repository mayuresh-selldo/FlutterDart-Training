import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final _taskTableName = "tasks";
  final _taskIdColumnName = "id";
  final _taskTitleName = "title";
  final _taskDescriptionColumnName = "description";
  final _taskDateColumnName = "date";
  final _taskTimeColumnName = "time";
  final _taskStatusColumnName = "status";

  DatabaseService._constructor();

  Future<Database?> get database async {
    if (_db != null) return _db;
    _db = await getDataBase();
    return _db;
  }

  Future<Database> getDataBase() async {
    final databaseDirectoryPath = await getDatabasesPath();
    final dataBasePath = join(databaseDirectoryPath, "master_db.db");

    final database = await openDatabase(
      dataBasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
            CREATE TABLE $_taskTableName(
              $_taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
              $_taskTitleName VARCHAR NOT NULL,
              $_taskDescriptionColumnName TEXT,
              $_taskDateColumnName TEXT,
              $_taskTimeColumnName TEXT,
              $_taskStatusColumnName INTEGER NOT NULL
            )
          ''');
      },
    );
    return database;
  }

  Future<int> addTask(String title, String? description, DateTime? date,
      TimeOfDay? time, int status) async {
    final db = await database;

    final data = {
      _taskTitleName: title,
      _taskDescriptionColumnName: description ?? '',
      _taskDateColumnName: date?.toIso8601String(),
      _taskTimeColumnName: time != null ? '${time.hour}:${time.minute}' : null,
      _taskStatusColumnName: status,
    };

    return await db!.insert(_taskTableName, data);
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final db = await database;
    return await db!.query(_taskTableName);
  }

  Future<int> updateTask(
    int id,
    String title,
    String? description,
    DateTime? date,
    TimeOfDay? time,
    int status,
  ) async {
    final db = await database;

    final data = {
      _taskTitleName: title,
      _taskDescriptionColumnName: description ?? '',
      _taskDateColumnName: date?.toIso8601String(),
      _taskTimeColumnName: time != null ? '${time.hour}:${time.minute}' : null,
      _taskStatusColumnName: status,
    };

    return await db!.update(
      _taskTableName,
      data,
      where: '$_taskIdColumnName = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db!.delete(
      _taskTableName,
      where: '$_taskIdColumnName = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>?> getTask(int id) async {
    final db = await database;
    final results = await db!.query(
      _taskTableName,
      where: '$_taskIdColumnName = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }
}

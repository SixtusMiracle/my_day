import 'dart:async';

import 'package:my_day/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlWaitress {
  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE tasks(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      icon TEXT NOT NULL,
      title TEXT NOT NULL,
      description TEXT NOT NULL,
      schedule INTEGER NOT NULL,
      isDone INTEGER NOT NULL DEFAULT 0,
    )""");
  }

  static Future<Database> database() async {
    String path = join(await getDatabasesPath(), 'miday.db');
    int dbVersion = 1;

    return openDatabase(
      path,
      version: dbVersion,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createTask(Task newTask) async {
    final db = await database();

    final id = await db.insert(
      "tasks",
      newTask.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await database();
    return db.query("tasks", orderBy: "id DESC");
  }

  static Future<int> updateTaskWhenItIsDone(int id) async {
    final db = await database();

    final result =
        await db.rawUpdate("UPDATE tasks SET isDone = 1, WHERE id = ?", [id]);
    return result;
  }

  static Future<void> deleteTask(int id) async {
    final db = await database();

    await db.delete(
      "tasks",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlWaitress {
  // Interacts with the [Database]
  SqlWaitress();

  static Future<void> createTables(Database database) async {
    await database.execute('''CREATE TABLE tasks(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      icon TEXT,
      title TEXT,
      description TEXT,
      schedule INTEGER,
      isDone INTEGER NOT NULL DEFAULT "0"
    )''');
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

  static Future<int> createTask(Map<String, dynamic> newTask) async {
    final db = await database();

    final id = await db.insert(
      "tasks",
      newTask,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await database();
    return db.query("tasks", orderBy: "id DESC");
  }

  static Future<void> updateTaskStatus(int id, bool isDone) async {
    final db = await database();

    if (isDone) {
      await db.rawUpdate("UPDATE tasks SET isDone = ? WHERE id = ?", [1, id]);
    } else {
      await db.rawUpdate("UPDATE tasks SET isDone = ? WHERE id = ?", [0, id]);
    }
  }

  static Future<void> deleteTask(int id) async {
    final db = await database();

    await db.delete(
      "tasks",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<int> getBiggestIdFromTasks() async {
    final db = await database();

    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM tasks");
    int id = table.first["id"] == null ? 1 : table.first["id"] as int;
    return id;
  }
}

import 'package:check_it_fixed_version/models/tasks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:convert';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tasksData.db'),
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE tasks (
      position INTEGER PRIMARY KEY, name TEXT, details TEXT, isDone BIT
      )
      ''');
      },
      version: 1,
    );
  }

  getTasks(tasks) async {
    final db = await database;
    List<Map<String, dynamic>> tasksList = await db.query('tasks');
    tasks.clear();
    for (Map taskMap in tasksList) {
      print(taskMap['name']);
      tasks.insert(
          tasks.length,
          Task(
              position: taskMap['position'],
              name: taskMap['name'],
              details: taskMap['details'],
              isDone: taskMap['isDone'] == 0 ? false : true));
    }
  }

  saveTasks(tasks) async {
    final db = await database;
    db.rawDelete('''
    DELETE FROM tasks
    ''');
    for (Task task in tasks) {
      db.insert('tasks', task.toMap());
      print('tasks saved');
    }
    saveData(tasks);
  }
}

void saveData(tasks) {
  List<String> spList;
  for (Task task in tasks) {
    var newListItem = json.encode(task.toMap());
    print(newListItem);
    spList.add(newListItem);
  }
  print(spList);
}

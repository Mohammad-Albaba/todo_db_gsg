import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_db_gsg/models/task_model.dart';

class DbHelper{
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  static final String dbName = 'tasks.db';
  static final String tableName = 'tasks';
  static final String idColumn = 'id';
  static final String taskNameColumn = 'taskName';
  static final String taskIsCompleteColumn = 'isComplete';
  Database database;
  initDatabase() async{
    database = await createConnection();
  }
  Future<Database> createConnection() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$dbName';
    Database database = await openDatabase(path,version: 1,onCreate: (db,version){
      db.execute('''CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $taskNameColumn TEXT, $taskIsCompleteColumn INTEGER)''');
    });
    return database;
  }
  Future<int> createNewTask(TaskModel taskModel)async{
   try {
     int x = await database.insert(tableName, taskModel.toMap());
     return x;
   } on Exception catch (e) {
     return null;
   }
  }
  Future<List<TaskModel>>getAllTasks()async{
    try {
      List<Map<String, dynamic>> results = await database.query(tableName);
      List<TaskModel> tasks = results.map((e) => TaskModel.fromMap(e)).toList();
      return tasks;
    } on Exception catch (e) {
      return null;
    }
  }
  Future<bool> updateTask(TaskModel taskModel)async{
    try {
      await database.update(tableName, taskModel.toMap(), where: '$idColumn=?',whereArgs: [taskModel.id]);
      return true;
    } on Exception catch (e) {
      return null;
    }
  }
  deleteTask(TaskModel taskModel)async{
    try {
      await database.delete(tableName, where: '$idColumn=?',whereArgs: [taskModel.id]);
      return true;
    } on Exception catch (e) {
      return null;
    }
  }
}



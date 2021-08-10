import 'package:flutter/cupertino.dart';
import 'package:todo_db_gsg/helpers/db_helper.dart';
import 'package:todo_db_gsg/models/task_model.dart';

class TodoProvider extends ChangeNotifier{
  TodoProvider(){
    getAllTask();
  }
  List<TaskModel> allTasks;
  List<TaskModel> completeTasks;
  List<TaskModel> inCompleteTasks;

  String testName = 'Mohammad Ayman Aneas Albaba';
  changeTestName(String newName){
    this.testName = newName;
    notifyListeners();
  }
  getAllTask() async{
    this.allTasks = await DbHelper.dbHelper.getAllTasks();
    this.completeTasks = this.allTasks.where((element) => element.isComplete).toList();
    this.inCompleteTasks = this.allTasks.where((element) => !element.isComplete).toList();
    notifyListeners();

  }
  insertTask(TaskModel taskModel) async{
    await DbHelper.dbHelper.createNewTask(taskModel);
    getAllTask();
  }
  deleteTask(TaskModel taskModel) async{
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTask();
  }
  updateTask(TaskModel taskModel) async{
    await DbHelper.dbHelper.updateTask(taskModel);
    getAllTask();
  }
}
import 'package:flutter/material.dart';
import 'package:todo_db_gsg/helpers/db_helper.dart';
import 'package:todo_db_gsg/models/task_model.dart';
import 'package:todo_db_gsg/ui/pages/all_tasks.dart';
import 'package:todo_db_gsg/ui/pages/complete_tasks.dart';
import 'package:todo_db_gsg/ui/pages/incomplete_tasks.dart';
import 'package:todo_db_gsg/ui/pages/new_task_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<TaskModel> tasks;
  insertNewTask(TaskModel taskModel) async{
    await DbHelper.dbHelper.createNewTask(taskModel);
    getAllTask();
  }
  getAllTask() async{
    List<TaskModel> tasks = await DbHelper.dbHelper.getAllTasks();
    this.tasks = tasks;
    setState(() {});
  }
  deleteTask(TaskModel taskModel) async{
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTask();
  }
  updateTask(TaskModel taskModel) async{
    await DbHelper.dbHelper.updateTask(taskModel);
    getAllTask();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => getAllTask());

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return NewTaskPage(insertNewTask);
                  }));
                }),
          ],
          title: Text('Todo App'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'All Tasks',),
              Tab(text: 'Complete Tasks',),
              Tab(text: 'InComplete Tasks',),
            ],
          ),
        ),
        body: this.tasks == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : TabBarView(
          children: [
            AllTasks(tasks, updateTask, deleteTask),
            CompleteTasks(tasks, updateTask, deleteTask),
            InCompleteTasks(tasks, updateTask, deleteTask),
          ],
        ),
      ),
    );
  }
}

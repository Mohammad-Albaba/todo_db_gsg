import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_gsg/helpers/db_helper.dart';
import 'package:todo_db_gsg/models/task_model.dart';
import 'package:todo_db_gsg/providers/todo_provider.dart';
import 'package:todo_db_gsg/ui/pages/all_tasks.dart';
import 'package:todo_db_gsg/ui/pages/complete_tasks.dart';
import 'package:todo_db_gsg/ui/pages/incomplete_tasks.dart';
import 'package:todo_db_gsg/ui/pages/new_task_page.dart';

class MainPage extends StatelessWidget {
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
                    return NewTaskPage();
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
        body: Provider.of<TodoProvider>(context).allTasks == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : TabBarView(
          children: [
            AllTasks(),
            CompleteTasks(),
            InCompleteTasks(),
          ],
        ),
      ),
    );
  }
}

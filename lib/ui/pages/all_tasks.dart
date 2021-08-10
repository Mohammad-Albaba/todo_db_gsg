import 'package:flutter/material.dart';
import 'package:todo_db_gsg/models/task_model.dart';
import 'package:todo_db_gsg/ui/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  List<TaskModel> tasks;
  Function updateFun;
  Function deleteFun;
  AllTasks(this.tasks,this.updateFun,this.deleteFun);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index){
          return TaskWidget(tasks[index],updateFun,deleteFun);
        }
    );
  }
}

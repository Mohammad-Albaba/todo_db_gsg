import 'package:flutter/material.dart';
import 'package:todo_db_gsg/models/task_model.dart';
import 'package:todo_db_gsg/ui/widgets/task_widget.dart';

class InCompleteTasks extends StatelessWidget {
  List<TaskModel> tasks;
  Function updateFun;
  Function deleteFun;
  InCompleteTasks(this.tasks,this.updateFun,this.deleteFun);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.where((element) => !element.isComplete).length,
        itemBuilder: (context, index){
          return TaskWidget(
            tasks.where((element) => !element.isComplete).toList()[index],updateFun,deleteFun
          );
        }
    );
  }
}

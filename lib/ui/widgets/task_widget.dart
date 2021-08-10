import 'package:flutter/material.dart';
import 'package:todo_db_gsg/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  Function updateFun;
  Function deleteFun;
  TaskWidget(this.taskModel,this.updateFun,this.deleteFun);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: taskModel.isComplete ? Colors.green : Colors.redAccent,
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(value: taskModel.isComplete, onChanged: (v){
            taskModel.isComplete = v ;
            updateFun(taskModel);
          }),
          SizedBox(width: 10,),
          Expanded(child: Text(taskModel.taskName)),
          // Spacer(),
          IconButton(icon: Icon(Icons.delete), onPressed: (){
            deleteFun(taskModel);
          }),
        ],
      ),
    );
  }
}

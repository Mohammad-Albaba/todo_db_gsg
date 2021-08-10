import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_gsg/helpers/db_helper.dart';
import 'package:todo_db_gsg/providers/todo_provider.dart';
import 'package:todo_db_gsg/ui/pages/main_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(
      ChangeNotifierProvider<TodoProvider>(
          create: (context) => TodoProvider(),
          child: MaterialApp(home: MainPage())));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              Provider.of<TodoProvider>(context).testName,
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 25,
              ),
          ),
          ElevatedButton(
            child: Text('Change Provider Value'),
            onPressed: (){
              Provider.of<TodoProvider>(context,listen: false)
                  .changeTestName('Omar');

            },
          ),
        ],
      ),
    );
  }
}


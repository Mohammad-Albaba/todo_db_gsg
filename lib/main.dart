import 'package:flutter/material.dart';
import 'package:todo_db_gsg/helpers/db_helper.dart';
import 'package:todo_db_gsg/ui/pages/main_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MaterialApp(home: MainPage()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


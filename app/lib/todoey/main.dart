import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/todoey/models/tasks_data.dart';
import 'package:flutter_dev_bootcamp/todoey/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksData>(
      create: (_) => TasksData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

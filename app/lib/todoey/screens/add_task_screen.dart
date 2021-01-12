import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/todoey/models/task.dart';
import 'package:flutter_dev_bootcamp/todoey/models/tasks_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                controller: _nameController,
                autofocus: true,
              ),
              SizedBox(height: 20),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => _addTask(context),
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addTask(BuildContext context) {
    Provider.of<TasksData>(context, listen: false).addTask(
      Task(title: _nameController.text),
    );
    Navigator.of(context).pop();
  }
}

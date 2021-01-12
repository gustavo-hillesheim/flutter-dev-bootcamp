import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/todoey/components/task_tile.dart';
import 'package:flutter_dev_bootcamp/todoey/models/task.dart';
import 'package:flutter_dev_bootcamp/todoey/models/tasks_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  TasksList({this.tasks = const []});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskTile(
              task: task,
              onToggleDone: (isDone) {
                Provider.of<TasksData>(context, listen: false)
                    .setIsDone(task, isDone);
              },
              onDelete: () {
                Provider.of<TasksData>(context, listen: false).deleteTask(task);
                _showDeletedTaskSnackbar(task, context);
              },);
        },);
  }

  void _showDeletedTaskSnackbar(Task task, BuildContext context) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed task: ${task.title}'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              Provider.of<TasksData>(context, listen: false).addTask(task);
            },
          ),
        ),
    );
  }
}

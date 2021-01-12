import 'package:flutter/material.dart';
import 'package:flutter_dev_bootcamp/todoey/models/task.dart';

class TaskTile extends StatelessWidget {
  TaskTile({@required this.task, @required this.onToggleDone, @required this.onDelete});

  final Task task;
  final ValueChanged<bool> onToggleDone;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onToggleDone(!task.isDone),
      onLongPress: onDelete,
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: onToggleDone,
      ),
    );
  }
}

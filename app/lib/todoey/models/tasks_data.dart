import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_dev_bootcamp/todoey/models/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy milk'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void setIsDone(Task task, bool isDone) {
    task.isDone = isDone;
    notifyListeners();
  }
}
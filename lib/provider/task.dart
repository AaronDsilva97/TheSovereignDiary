import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../helper/task_database.dart';

class Tasks with ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;
  List<Task> _myTask = [
    Task(
      id: 1,
      taskName: "Task",
      description: "Description",
      initialDate: DateTime.now(),
      startTime: " ",
      endTime: TimeOfDay.now(),
      week: DateTime.now(),
      category: "General",
      remindMe: false,
    ),
    Task(
      id: 2,
      taskName: "Another Task",
      description: "Description",
      initialDate: DateTime.now(),
      startTime: " ",
      endTime: TimeOfDay.now(),
      week: DateTime.now(),
      category: "General",
      remindMe: false,
    ),
  ].toList();

  List<Task> get tasks {
    return [..._myTask];
  }

  void addTask({taskName, description, category, startTime}) {
    _myTask.add(
      Task(
        id: 3,
        taskName: taskName,
        description: description,
        initialDate: DateTime.now(),
        week: DateTime.now(),
        startTime: startTime,
        endTime: TimeOfDay.now(),
        category: category,
        remindMe: false,
      ),
    );

    notifyListeners();

    dbHelper.insert({
      DatabaseHelper.taskName: taskName,
      DatabaseHelper.description: description,
      DatabaseHelper.initialDate: DateTime.now().toIso8601String(),
      DatabaseHelper.week: DateTime.now().toIso8601String(),
      DatabaseHelper.startTime: startTime,
      DatabaseHelper.endTime: DateTime.now().toIso8601String(),
      DatabaseHelper.category: "General",
      DatabaseHelper.remindMe: 0,
    });
  }

  Future<void> fetchTask() async {
    final taskList = await dbHelper.queryAllRows();
    print(taskList);
    _myTask = taskList
        .map(
          (e) => Task(
            id: e[DatabaseHelper.columnId],
            taskName: e[DatabaseHelper.taskName],
            description: e[DatabaseHelper.description],
            initialDate: DateTime.now(),
            week: DateTime.now(),
            startTime: e[DatabaseHelper.startTime],
            endTime: TimeOfDay.now(),
            category: e[DatabaseHelper.category],
            remindMe: e[DatabaseHelper.remindMe],
          ),
        )
        .toList();

    notifyListeners();
  }
}

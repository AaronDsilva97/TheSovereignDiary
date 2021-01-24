import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/daily.dart';
import '../helper/daily_task_database.dart';

class DailyTask with ChangeNotifier {
  final helper = DailyTaskHelper.instance;
  List<Daily> _dailyTask = [
    Daily(
      id: 1,
      category: "General",
      dailyTask: "Sleep",
      // dayOfWeek: [
      //   "Mon",
      //   "Tue",
      //   "Wed",
      //   "Thur",
      //   "Fri",
      //   "Sat",
      //   "Sun",
      // ],
      description: "Sleep is a must",
      // startTime: TimeOfDay.now(),
      // endTime: TimeOfDay.now(),
      // priority: 1,
      // status: "To do",
    ),
    Daily(
      id: 2,
      category: "General",
      dailyTask: "Sleep",
      description: "Hello",
    ),
  ];

  List<Daily> get dailyTasks {
    return [..._dailyTask];
  }

  void addDailyTask({dailyTask, description, category}) {
    _dailyTask.add(
      Daily(
        id: 3,
        dailyTask: dailyTask,
        description: description,
        category: category,
      ),
    );

    notifyListeners();
    helper.insert({
      DailyTaskHelper.taskName: dailyTask,
      DailyTaskHelper.description: description,
      DailyTaskHelper.category: category,
    });
  }

  Future<void> fetchDailyTask() async {
    final dailyTaskList = await helper.queryAllRows();
    print(dailyTaskList);
    _dailyTask = dailyTaskList
        .map(
          (e) => Daily(
            id: e[DailyTaskHelper.columnId],
            dailyTask: e[DailyTaskHelper.taskName],
            description: e[DailyTaskHelper.description],
            category: e[DailyTaskHelper.category],
          ),
        )
        .toList();
    notifyListeners();
  }
}

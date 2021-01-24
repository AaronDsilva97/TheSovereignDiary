import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  int id;
  String taskName;
  String description;
  DateTime initialDate;
  DateTime week;
  String startTime;
  TimeOfDay endTime;
  String category;
  bool remindMe;

  Task({
    @required this.id,
    @required this.taskName,
    @required this.description,
    @required this.initialDate,
    @required this.week,
    @required this.startTime,
    @required this.endTime,
    @required this.category,
    this.remindMe,
  });
}

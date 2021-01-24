import 'package:flutter/material.dart';
import './screens/add_task.dart';
import './provider/task.dart';
import './provider/daily.dart';

import './navigation/bottom_nav.dart';
import 'package:provider/provider.dart';
import './screens/add_daily_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Tasks>(
          create: (context) => Tasks(),
        ),
        ChangeNotifierProvider<DailyTask>(
          create: (context) => DailyTask(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => BottomTabNav(),
          AddTask.routeName: (context) => AddTask(),
          AddDailyTask.routeName: (context) => AddDailyTask(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../provider/daily.dart';
import 'package:provider/provider.dart';

class DailyTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final dailyTask = Provider.of<DailyTask>(context).dailyTasks;
    return FutureBuilder(
      future: Provider.of<DailyTask>(context, listen: false).fetchDailyTask(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<DailyTask>(
                  builder: (ctx, dailyTask, child) => ListView.builder(
                    itemCount: dailyTask.dailyTasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            Text("${dailyTask.dailyTasks[index].dailyTask}"),
                            Text("${dailyTask.dailyTasks[index].category}"),
                            Text("${dailyTask.dailyTasks[index].description}"),
                            // Text("${dailyTask[index].endTime.format(context)}"),
                            // Text("${dailyTask[index].startTime.format(context)}"),
                          ],
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/task.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Tasks>(context).tasks;
    return Container(
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Provider.of<Tasks>(context, listen: false).fetchTask(),
              builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: task.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  Text(task[index].taskName),
                                  Text(task[index].description),
                                  Text(task[index].category),
                                  Text(task[index].startTime),
                                ],
                              ),
                            );
                          },
                        ),
            ),
          )
        ],
      ),
    );
  }
}

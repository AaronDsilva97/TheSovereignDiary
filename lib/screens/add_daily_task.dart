import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/daily.dart';

class AddDailyTask extends StatefulWidget {
  static const routeName = "daily-task";
  @override
  _AddDailyTaskState createState() => _AddDailyTaskState();
}

class _AddDailyTaskState extends State<AddDailyTask> {
  final _formKey = GlobalKey<FormState>();
  String dailyTaskName = "";
  String descriptionDetail = "";
  String categoryDetail = "";

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<DailyTask>(context, listen: false).addDailyTask(
        dailyTask: dailyTaskName,
        description: descriptionDetail,
        category: categoryDetail,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Task",
                  contentPadding: EdgeInsets.all(15.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some task";
                  }
                  return null;
                },
                onSaved: (value) => dailyTaskName = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  contentPadding: EdgeInsets.all(15.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some task";
                  }
                  return null;
                },
                onSaved: (value) => descriptionDetail = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Category",
                  contentPadding: EdgeInsets.all(15.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter some task";
                  }
                  return null;
                },
                onSaved: (value) => categoryDetail = value,
              ),
              RaisedButton(
                onPressed: () => submit(),
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

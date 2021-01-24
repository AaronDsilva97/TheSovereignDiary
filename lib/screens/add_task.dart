import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
import '../provider/task.dart';

class AddTask extends StatefulWidget {
  static const routeName = "./add_task";
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  String taskName = "";
  String description = "";
  String category = "";
  String _startTime = "";
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _timeController = TextEditingController();
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        _timeController.text = picked.format(context);
      });
  }

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<Tasks>(context, listen: false).addTask(
        taskName: taskName,
        category: category,
        description: description,
        startTime: _startTime,
      );
      Navigator.of(context).popAndPushNamed("/");
    }
  }

  final categoryType = [
    "Important",
    "Not Important",
    "Urgent",
    "Not Urgent",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                onSaved: (value) => taskName = value,
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
                onSaved: (value) => description = value,
              ),
              DropdownButtonFormField(
                  items: categoryType
                      .map((e) =>
                          DropdownMenuItem<String>(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) => category = value),
              IconButton(
                icon: Icon(Icons.data_usage_sharp),
                onPressed: () {
                  _selectTime(context);
                },
              ),
              TextFormField(
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
                onSaved: (String val) {
                  _startTime = val;
                },
                enabled: false,
                keyboardType: TextInputType.text,
                controller: _timeController,
                decoration: InputDecoration(
                    disabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    // labelText: 'Time',
                    contentPadding: EdgeInsets.all(5)),
              ),
              ElevatedButton(
                onPressed: () {
                  submit();
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

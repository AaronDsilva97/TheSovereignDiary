import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/add_task.dart';
// import '../screens/quotes_screen.dart';
import '../screens/daily_task_screen.dart';
import '../screens/add_daily_task.dart';

class BottomTabNav extends StatefulWidget {
  BottomTabNav({Key key}) : super(key: key);

  @override
  _BottomTabNavState createState() => _BottomTabNavState();
}

/// This is the private State class that goes with BottomTabNav.
class _BottomTabNavState extends State<BottomTabNav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    AddTask(),
    DailyTaskScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Sovereign Diary'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.pushNamed(
              context,
              AddDailyTask.routeName,
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

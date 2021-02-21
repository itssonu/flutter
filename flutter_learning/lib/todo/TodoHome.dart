import 'package:flutter/material.dart';

import 'screens/TasksScreen.dart';

class TodoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        backgroundColor: Colors.lightBlueAccent,
      ),
      home: TasksScreen(),
    );
  }
}

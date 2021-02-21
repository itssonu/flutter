import 'package:flutter/material.dart';
import 'package:flutter_learning/todo/widgets/BottomPart.dart';
import 'package:flutter_learning/todo/widgets/BottomSheet.dart';
import 'package:flutter_learning/todo/widgets/Task.dart';
import 'package:flutter_learning/todo/widgets/TopPart.dart';
// import 'package:flutter_learning/chat/utilities/methods.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<TaskBuilder> tasks = [
    TaskBuilder(name: 'task1'),
    TaskBuilder(name: 'task2'),
    TaskBuilder(name: 'task3'),
    TaskBuilder(name: 'task4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('plus bitton clicked');
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => CustomBottomSheet(
                    callback: (value) {
                      setState(() {
                        tasks.add(TaskBuilder(name: value));
                      });
                      Navigator.pop(context);
                    },
                  ));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TopPart(tasks), BottomPart(tasks)],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_learning/todo/widgets/Task.dart';

class TopPart extends StatelessWidget {
  final List<TaskBuilder> tasks;

  const TopPart(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
              size: 30.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'ToDo App',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            '${tasks.length} Task Pending',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              // fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

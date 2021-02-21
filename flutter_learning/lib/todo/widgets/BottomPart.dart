import 'package:flutter/material.dart';
import 'package:flutter_learning/todo/widgets/Task.dart';

class BottomPart extends StatelessWidget {
  final List<TaskBuilder> tasks;

  const BottomPart(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: 300.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: TaskList(tasks),
      ),
    );
  }
}

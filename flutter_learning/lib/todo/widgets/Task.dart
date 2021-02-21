import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final List<TaskBuilder> tasks;

  const TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Task(
          title: widget.tasks[index].name,
          isChecked: widget.tasks[index].isChecked,
          callback: (checkboxState) {
            setState(() {
              widget.tasks[index].checkboxToggle();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}

class Task extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function callback;

  Task(
      {@required this.isChecked,
      @required this.title,
      @required this.callback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: callback,
        value: isChecked,
      ),
    );
  }
}

class TaskBuilder {
  final String name;
  bool isChecked = false;

  TaskBuilder({this.name});

  void checkboxToggle() {
    isChecked = !isChecked;
  }
}

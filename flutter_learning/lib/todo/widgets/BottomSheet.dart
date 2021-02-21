import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatefulWidget {
  final Function callback;

  CustomBottomSheet({this.callback});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String taskText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        // height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                onChanged: (v) {
                  // print(v);
                  // setState(() {
                  taskText = v;
                  // });
                },
                autofocus: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  focusColor: Colors.lightBlueAccent,
                  fillColor: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              FlatButton(
                height: 50.0,
                minWidth: double.infinity,
                color: Colors.lightBlueAccent,
                onPressed: () {
                  widget.callback(taskText);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

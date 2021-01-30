import 'package:flutter/material.dart';

// ignore: camel_case_types
class Self_Container extends StatelessWidget {
  final Color color;
  final Widget child;

  Self_Container({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class Desionball extends StatefulWidget {
  @override
  _DesionballState createState() => _DesionballState();
}

// 6
class _DesionballState extends State<Desionball> {
  int ballnumber = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.shade700,
          title: Text('Dession Ball'),
          centerTitle: true,
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {
              setState(() {
                ballnumber = Random().nextInt(5) + 1;
              });
            },
            child: Image.asset('assets/images/ball$ballnumber.png'),
          ),
        ),
      ),
    );
  }
}

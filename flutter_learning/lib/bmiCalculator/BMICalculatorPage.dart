import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  get color => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Self_Container(
                  color: Color(0xFF1D1E33),
                ),
              ),
              Expanded(
                child: Self_Container(color: Color(0xFF1D1E33)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Expanded(
            child: Self_Container(color: Color(0xFF1D1E33)),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Self_Container(color: Color(0xFF1D1E33)),
              ),
              Expanded(
                child: Self_Container(color: Color(0xFF1D1E33)),
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xFFEB1555),
          width: double.infinity,
          height: 80.0,
          margin: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class Self_Container extends StatelessWidget {
  final Color color;

  Self_Container({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_learning/weather/screens/LoadingScreen.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}

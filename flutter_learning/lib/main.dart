import 'package:flutter/material.dart';
import 'package:flutter_learning/routes.dart';

import 'package:flutter_learning/bmiCalculator/BMICalculator.dart';

void main() {
  runApp(BMICalculator());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/i_am_rich',
      routes: routes,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MenuButton(
                      onTap: () {
                        print('I am rich tapped');
                        Navigator.pushNamed(context, '/i_am_rich');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => IAmRich()),
                        // );
                      },
                      color: Colors.black,
                      appName: 'I Am Rich',
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class MenuButton extends StatelessWidget {
  final Color color;
  final String appName;
  final Function onTap;
  const MenuButton({this.color, this.appName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Center(
            child: Text(
              appName,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
        ),
      ),
    );
  }
}

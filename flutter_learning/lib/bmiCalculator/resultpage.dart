import 'package:flutter/material.dart';
// import 'package:flutter_learning/bmiCalculator/BMICalculatorPage.dart';

import 'reusable/bottomButton.dart';
import 'reusable/Self_Container.dart';
import 'constants.dart';
//bmi calculator
// import '../main.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final String result;
  final String text;

  const ResultPage({this.title, this.result, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
                  style: klargeTextstyle.copyWith(fontSize: 40.0)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Self_Container(
              color: kactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: kresultTitleStyle,
                  ),
                  Text(
                    result,
                    style: kresult,
                  ),
                  Text(
                    text,
                    style: kresultdes,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BottomButton(
              label: 'RE:CALCULATE',
            ),
          )
        ],
      ),
    );
  }
}

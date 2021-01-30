// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable/IconContent.dart';
import 'reusable/Self_Container.dart';

import 'constants.dart';

enum Gender { Male, Female }

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Self_Container(
                  sOnTap: () {
                    print('male pressed');

                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  color: selectedGender == Gender.Male
                      ? kactiveCardColor
                      : kinactiveCardColor,
                  child:
                      IconContent(icon: FontAwesomeIcons.male, label: 'MALE'),
                ),
              ),
              Expanded(
                child: Self_Container(
                  sOnTap: () {
                    print('female pressed');

                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  color: selectedGender == Gender.Female
                      ? kactiveCardColor
                      : kinactiveCardColor,
                  child: IconContent(
                      icon: FontAwesomeIcons.female, label: 'FEMALE'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Self_Container(
            color: kactiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: klabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: knumberLabelStyle,
                    ),
                    Text(
                      'Cm',
                      style: klabelStyle,
                    ),
                  ],
                ),
                Slider(
                  onChanged: (double newHeight) {
                    setState(() {
                      height = newHeight.toInt();
                    });
                  },
                  min: 100.0,
                  max: 400.0,
                  activeColor: kactiveSliderColor,
                  value: height.toDouble(),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Self_Container(color: kactiveCardColor),
              ),
              Expanded(
                child: Self_Container(color: kactiveCardColor),
              ),
            ],
          ),
        ),
        Container(
          // theme:ThemeData()
          width: double.infinity,
          height: kbottomContainerHeight,
          margin: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: kbottomContainerColor,
            // borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types

// onTap: () {
//                 print('female pressed');

//                 setState(() {
//                   selectedGender = Gender.Female;
//                 });
//               },

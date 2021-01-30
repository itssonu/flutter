// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../reusable/IconContent.dart';
import '../reusable/Self_Container.dart';

const bottomContainerHeight = 80.0;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF11328);
const Color bottomContainerColor = Color(0xFFEB1555);

enum Gender { Male, Female }

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  Gender selectedGender;

// 1=male, 2= femlae
  // void updateColor(Gender gender) {
  //   if (gender == Gender.Male) {
  //     if (maleCardColor == activeCardColor) {
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = activeCardColor;
  //     }

  //     femaleCardColor = inactiveCardColor;
  //   } else if (gender == Gender.Female) {
  //     if (femaleCardColor == activeCardColor) {
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = activeCardColor;
  //     }
  //     maleCardColor = inactiveCardColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('male pressed');

                    setState(() {
                      // updateColor(Gender.Male);
                      // maleCardColor == activeCardColor
                      //     ? maleCardColor = inactiveCardColor
                      //     : maleCardColor = activeCardColor;
                      // femaleCardColor = inactiveCardColor;
                      selectedGender = Gender.Male;
                    });
                  },
                  child: Self_Container(
                    color: selectedGender == Gender.Male
                        ? activeCardColor
                        : inactiveCardColor,
                    child:
                        IconContent(icon: FontAwesomeIcons.male, label: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('female pressed');

                    setState(() {
                      // updateColor(Gender.Female);
                      selectedGender = Gender.Female;
                      // femaleCardColor == activeCardColor
                      //     ? femaleCardColor = inactiveCardColor
                      //     : femaleCardColor = activeCardColor;
                      // maleCardColor = inactiveCardColor;
                    });
                  },
                  child: Self_Container(
                    color: selectedGender == Gender.Female
                        ? activeCardColor
                        : inactiveCardColor,
                    child: IconContent(
                        icon: FontAwesomeIcons.female, label: 'FEMALE'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Self_Container(color: activeCardColor),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Self_Container(color: activeCardColor),
              ),
              Expanded(
                child: Self_Container(color: activeCardColor),
              ),
            ],
          ),
        ),
        Container(
          // theme:ThemeData()
          width: double.infinity,
          height: bottomContainerHeight,
          margin: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: bottomContainerColor,
            // borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types

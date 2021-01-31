// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable/IconContent.dart';
import 'reusable/Self_Container.dart';
import 'reusable/bottomButton.dart';

import 'constants.dart';
import 'resultpage.dart';

import 'bmibrain.dart';

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
  int weight = 60;
  int age = 20;

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
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 2,
                      overlayColor: Color(0x30EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: ksliderThumbColor,
                      activeTrackColor: Colors.white,
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.toInt();
                      });
                    },
                    min: 100.0,
                    max: 400.0,
                    // activeColor: Colors.white,
                    value: height.toDouble(),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Self_Container(
                  color: kactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: klabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: knumberLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight <= 5 ? weight = weight : weight--;
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight >= 100 ? weight = weight : weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Self_Container(
                  color: kactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: klabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: knumberLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age <= 5 ? age = age : age--;
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age >= 100 ? age = age : age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            print(height);
            print(weight);
            BmiBrain calc = BmiBrain(height: height, weight: weight);
            // print(calc.getTitle());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  result: calc.calculateBMI(),
                  title: calc.getTitle(),
                  text: calc.getResultDes(),
                ),
              ),
            );
          },
          child: BottomButton(
            label: 'CALCULATE',
          ),
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundIconButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon),
    );
  }
}

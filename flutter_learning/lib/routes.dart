import 'package:flutter/material.dart';
import 'package:flutter_learning/main.dart';
import 'package:flutter_learning/bmiCalculator/BMICalculator.dart';
import 'package:flutter_learning/container/containerLearn.dart';
import 'package:flutter_learning/desionball/Desionball.dart';
import 'package:flutter_learning/dice/DiceApp.dart';
import 'package:flutter_learning/iamrich/IAmRich.dart';
import 'package:flutter_learning/myprofilecard/MyProfileCard.dart';
import 'package:flutter_learning/quiz/Quizzler.dart';
import 'package:flutter_learning/weather/Weather.dart';
import 'package:flutter_learning/weather/screens/LocationScreen.dart';
import 'package:flutter_learning/xquiz/xquiz_main.dart';
import 'package:flutter_learning/xylophone/XyloPhone.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => MyHome(),
  'i_am_rich': (context) => IAmRich(),
  'container_learn': (context) => ContainerLearn(),
  'my_profile_card': (context) => MyProfileCard(),
  'dice': (context) => DiceApp(),
  'desionball': (context) => Desionball(),
  'xylophone': (context) => XyloPhone(),
  'quiz': (context) => Quizzler(),
  'xquiz': (context) => XQuiz(),
  'bmi': (context) => BMICalculator(),
  'weather': (context) => Weather(),
  // 'weather/locationScreen': (context) => LocationScreen(),
  'crypto': (context) => (),
};

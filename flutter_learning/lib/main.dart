import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'quizzler/QuestionBrain.dart';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//XQuizBrain App
import 'xquiz/XQuizBrain.dart';

//bmi calculator
import 'bmiCalculator/BMICalculatorPage.dart';

void main() {
  runApp(BMICalculator());
}

// 1
class IAmRich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Image.asset('assets/images/diamond.png'),
        ),
      ),
    );
  }
}

// 2
class ContainerLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.redAccent,
                height: 100.0,
                width: 100.0,
                padding: EdgeInsets.all(10.0),
                // margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Text('Cotainer1'),
              ),
              Container(
                color: Colors.blueAccent,
                height: 100.0,
                width: 100.0,
                padding: EdgeInsets.all(10.0),
                // margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Text('Cotainer2'),
              ),
              Container(
                color: Colors.greenAccent,
                height: 100.0,
                width: 100.0,
                padding: EdgeInsets.all(10.0),
                // margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Text('Cotainer3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 3
class MyProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent[400],
        appBar: AppBar(
          backgroundColor: Colors.tealAccent[700],
          title: Text('My Profile Card'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  // backgroundColor: Colors.lightBlueAccent,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                Text(
                  'Sonu Gupta',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'full stack developer'.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                Divider(
                  color: Colors.tealAccent,
                  thickness: 2,
                  height: 20.5,
                  indent: 80,
                  endIndent: 80,
                ),
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 20.0,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      '+91 1234567890',
                      style: TextStyle(color: Colors.teal.shade900),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.email,
                        size: 20.0,
                        color: Colors.teal.shade900,
                      ),
                      title: Text(
                        'sonu98gupta@gmail.com',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 4
class DiceApp extends StatefulWidget {
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftdicenumber = 1;
  int rightdicenumber = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent.shade400,
        appBar: AppBar(
          backgroundColor: Colors.redAccent.shade400,
          title: Text('Dice App'),
        ),
        body: Center(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache(prefix: 'sounds/');

                    // call this method when desired
                    player.play('dice.wav');
                    print('left button pressed');
                    setState(() {
                      leftdicenumber = Random().nextInt(6) + 1;
                    });
                    // print(dicenumber);
                  },
                  child: Image(
                    image: AssetImage('assets/images/dice$leftdicenumber.png'),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    final player = AudioCache(prefix: 'sounds/');

                    // call this method when desired
                    player.play('dice.wav');
                    print('right button pressed');
                    setState(() {
                      rightdicenumber = Random().nextInt(6) + 1;
                    });
                    // print(dicenumber);
                  },
                  child: Image(
                    image: AssetImage('assets/images/dice$rightdicenumber.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 5
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

// 7
class XyloPhone extends StatelessWidget {
  void playsound(int soundnumber) {
    final player = AudioCache(prefix: 'sounds/');
    player.play('note$soundnumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('XylPhone'),
        ),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              newMethod(color: Colors.blueAccent, soundnumber: 1),
              newMethod(color: Colors.redAccent, soundnumber: 2),
              newMethod(color: Colors.greenAccent, soundnumber: 3),
              newMethod(color: Colors.orangeAccent, soundnumber: 4),
              newMethod(color: Colors.tealAccent, soundnumber: 5),
              newMethod(color: Colors.yellowAccent, soundnumber: 6),
              newMethod(color: Colors.purpleAccent, soundnumber: 7),
              // newMethod(),
              // newMethod(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded newMethod({Color color, int soundnumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playsound(soundnumber);
        },
      ),
    );
  }
}

// 8
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Quizzler'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Icon> scorekeeper = [];
  int numberOfCorrectAnswer = 0;

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs. ',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> answers = [false, true, true];

  // List<Question> questionBank = [
  //   Question('You can lead a cow down stairs but not up stairs. ', false),
  //   Question('Approximately one quarter of human bones are in the feet.', true),
  //   Question('A slug\'s blood is green.', true),
  // ];
  // int questionNumber = 0;

  QuestionBrain questionBrain = QuestionBrain();

  get questionBank => null;

  void checkAnswer(bool userPickup) {
    setState(() {
      bool correctanswer = questionBrain.getQuestionAnswer();

      if (correctanswer == userPickup) {
        numberOfCorrectAnswer++;
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.greenAccent,
        ));
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.redAccent,
        ));
      }

      if (questionBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'You\'ve reached the end of the quiz. And Score is $numberOfCorrectAnswer / ${questionBrain.getQuestionLength()}',
        ).show();

        questionBrain.reset();
        scorekeeper = [];
        numberOfCorrectAnswer = 0;
      }

      questionBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionBrain.getQuestionText(),
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              color: Colors.greenAccent,
              onPressed: () {
                this.checkAnswer(true);
              },
              child: Text('True'),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              color: Colors.redAccent,
              onPressed: () {
                this.checkAnswer(false);
              },
              child: Text('False'),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

// 9
class XQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            'XQuiz App',
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/xquiz.png'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: XQuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class XQuizPage extends StatefulWidget {
  @override
  _XQuizPageState createState() => _XQuizPageState();
}

class _XQuizPageState extends State<XQuizPage> {
  XQuizBrain story = XQuizBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              story.getStory(), //question area
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
          flex: 5,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  story.nextStory(1);
                });
              },
              child: Text(
                story.getChoice1(), // choice 1
              ),
              color: Colors.greenAccent,
            ),
          ),
        ),
        Visibility(
          visible: story.buttonShouldVisible(),
          child: Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    story.nextStory(2);
                  });
                },
                child: Text(
                  story.getChoice2(), // choice 2
                ),
                color: Colors.amberAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 10

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: BMICalculatorPage(),
      ),
    );
  }
}

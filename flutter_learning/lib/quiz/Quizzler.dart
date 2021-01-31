import 'package:flutter/material.dart';
import 'package:flutter_learning/quizzler/QuestionBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

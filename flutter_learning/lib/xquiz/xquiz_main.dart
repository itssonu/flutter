import 'package:flutter/material.dart';
import 'package:flutter_learning/xquiz/XQuizBrain.dart';

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

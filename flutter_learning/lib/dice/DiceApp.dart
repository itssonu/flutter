import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

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

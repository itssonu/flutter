import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

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
        child: null,
        color: color,
        onPressed: () {
          playsound(soundnumber);
        },
      ),
    );
  }
}

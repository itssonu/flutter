import 'package:flutter/material.dart';
import 'package:flutter_learning/chat/screens/welcome.dart';

class ChatHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
          centerTitle: true,
        ),
        body: Welcome(),
      ),
    );
  }
}

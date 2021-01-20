import 'package:flutter/material.dart';

void main() {
  runApp(IAmPoor());
}

class IAmPoor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
          title: Text('I Am Poor'),
          backgroundColor: Colors.lightBlue[900],
          centerTitle: true,
        ),
        body: Center(
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Coal_anthracite.jpg/220px-Coal_anthracite.jpg',
            width: 500,
            height: 500,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Text('Hello'),
          elevation: 200,
        ),
      ),
    );
  }
}

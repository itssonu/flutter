import 'package:flutter/material.dart';

void main() {
  runApp(MyProfileCard());
}

// 1
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
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                Text(
                  'Sonu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

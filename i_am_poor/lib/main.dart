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
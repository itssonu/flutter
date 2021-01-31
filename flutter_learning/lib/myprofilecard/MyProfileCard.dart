import 'package:flutter/material.dart';

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

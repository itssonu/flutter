import 'package:flutter/material.dart';
import 'package:flutter_learning/chat/screens/login.dart';
import 'package:flutter_learning/chat/screens/register.dart';
import 'package:flutter_learning/chat/utilities/widgets.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 1.0, 1.0, 1.0),
              child: Hero(
                tag: 'chat_logo',
                child: Container(
                  child: Image.asset('assets/chat/logo.png'),
                  height: 60.0,
                ),
              ),
            ),
            Text(
              'Flash Chat',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 10.0),
          child: CustomButton(
            name: 'Login',
            color: Colors.lightBlue[400],
            onPress: () {
              print('login Button pressed on welcome screen');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: CustomButton(
            name: 'Register',
            color: Colors.lightBlue[700],
            onPress: () {
              print('register Button pressed on welcome screen');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
          ),
        ),
      ],
    );
  }
}

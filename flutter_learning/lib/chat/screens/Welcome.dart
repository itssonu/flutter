// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_learning/chat/screens/login.dart';
import 'package:flutter_learning/chat/screens/register.dart';
import 'package:flutter_learning/chat/utilities/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = CurvedAnimation(curve: Curves.decelerate, parent: controller);
    animation2 =
        ColorTween(begin: Colors.black, end: Colors.white).animate(controller);

    controller.forward();

    // animation.addStatusListener((status) {
    //   print(status);
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation2.value,
      body: Column(
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
                    height: animation.value * 60.0,
                  ),
                ),
              ),
              TypewriterAnimatedTextKit(
                isRepeatingAnimation: false,
                speed: Duration(milliseconds: 500),
                text: ['Flash Chat'],
                textStyle: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              )
              // Text(
              //   'Flash Chat',
              //   style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              // )
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
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:flutter_learning/chat/utilities/methods.dart';
import 'package:flutter_learning/chat/utilities/widgets.dart';

class Login extends StatelessWidget {
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 1.0, 1.0, 1.0),
                child: Hero(
                  tag: 'chat_logo',
                  child: Container(
                    child: Image.asset('assets/chat/logo.png'),
                    height: 200.0,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 10.0),
            child: CustomTextField(
              hintText: 'User Name',
              onChanged: (v) {
                username = v;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 10.0),
            child: CustomTextField(
                hintText: 'Password',
                obscureText: true,
                onChanged: (v) {
                  password = v;
                }),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: CustomButton(
              name: 'Login',
              onPress: () {
                print(username);
                print(password);
              },
              color: Colors.lightBlue[700],
            ),
          ),
        ],
      ),
    );
  }
}

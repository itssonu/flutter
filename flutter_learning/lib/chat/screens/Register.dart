import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/chat/screens/Chat.dart';
import 'package:flutter_learning/chat/utilities/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String password;
  String email;
  bool showSpinner = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
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
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 10.0),
              child: CustomTextField(
                obscureText: true,
                hintText: 'Password',
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: CustomButton(
                name: 'Register',
                color: Colors.lightBlue[700],
                onPress: () async {
                  // print(password);
                  // print(email);
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

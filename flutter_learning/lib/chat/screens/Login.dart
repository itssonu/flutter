import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/chat/screens/Chat.dart';
// import 'package:flutter_learning/chat/utilities/methods.dart';
import 'package:flutter_learning/chat/utilities/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  String password;
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
                onPress: () async {
                  // print(username);
                  // print(password);
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final loggindata = await _auth.signInWithEmailAndPassword(
                        email: username, password: password);
                    if (loggindata != null) {
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
                color: Colors.lightBlue[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

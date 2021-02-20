import 'package:flutter/material.dart';

import 'methods.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.name,
    @required this.color,
    this.onPress,
  });

  final String name;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: color,
      child: MaterialButton(
        // minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onPress,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText,
    this.onChanged,
    this.obscureText,
    this.keyboardType,
  });

  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      obscureText: obscureText == null ? false : true,
      decoration: InputDecoration(
        hintText: hintText,
        border: textFieldBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }

  copywith() {}

  copyWith() {}
}

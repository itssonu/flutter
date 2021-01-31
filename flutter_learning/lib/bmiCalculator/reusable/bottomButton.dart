import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String label;
  const BottomButton({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          label == null ? '' : label,
          style: klargeTextstyle,
        ),
      ),
      width: double.infinity,
      height: kbottomContainerHeight,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: kbottomContainerColor,
        // borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

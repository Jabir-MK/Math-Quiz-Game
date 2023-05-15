// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:math_quiz/core/constants.dart';

class Keys extends StatelessWidget {
  Keys({
    super.key,
    required this.keyValue,
    required this.function,
  });

  final String keyValue;
  final VoidCallback function;
  var buttonColor = Colors.deepPurple[700];

  @override
  Widget build(BuildContext context) {
    if (keyValue == 'C') {
      buttonColor = Colors.green;
    } else if (keyValue == 'DEL') {
      buttonColor = Colors.red;
    } else if (keyValue == '=') {
      buttonColor = Colors.deepPurple[900];
    }
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              keyValue,
              style: whiteTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:math_quiz/core/constants.dart';

class ResultMessage extends StatelessWidget {
  const ResultMessage({
    super.key,
    required this.message,
    required this.nextQuestion,
    required this.icon,
  });
  final String message;
  final VoidCallback nextQuestion;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var iconColor = Colors.green;
    if (message == 'Correct') {
      iconColor = Colors.green;
    } else {
      iconColor = Colors.red;
    }
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            message,
            style: whiteTextColor,
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: nextQuestion,
            icon: Icon(
              icon,
              color: iconColor,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}

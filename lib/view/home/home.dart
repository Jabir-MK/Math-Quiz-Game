import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_quiz/core/constants.dart';
import 'package:math_quiz/view/home/widgets/number_keys.dart';
import 'package:math_quiz/view/home/widgets/popup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0'
  ];
  // Answer from user;
  String userAnswer = '';
  // Operands of question
  int numOne = 1;
  int numTwo = 1;

  // On key Press method
  void buttonTap(String button) {
    setState(() {
      // implementing clear method for 'C' and 'DEL' ,
      // Checking maximum legth can be typed and for '='
      // method also
      if (button == '=') {
        // calculate if user is correct
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 4) {
        userAnswer += button;
      }
    });
  }

  // Method to check the result of challenge
  void checkResult() {
    if (numOne + numTwo == int.parse(userAnswer)) {
      showDialog(
        context: context,
        builder: (context) => ResultMessage(
          message: 'Correct',
          nextQuestion: nextQuestion,
          icon: Icons.arrow_circle_right_outlined,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => ResultMessage(
          message: 'Incorrect',
          nextQuestion: currentQuestion,
          icon: Icons.refresh,
        ),
      );
    }
  }

  // Create Random Numbers
  var randomNumber = Random();
  void currentQuestion() {
    setState(() {
      userAnswer = '';
    });
    Navigator.of(context).pop();
  }

  void nextQuestion() {
    // dismiss alert
    Navigator.of(context).pop();
    // reset values of operands and useranswer
    setState(() {
      userAnswer = '';
    });
    // Creates a new question
    numOne = randomNumber.nextInt(100);
    numTwo = randomNumber.nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: SafeArea(
        child: Column(
          children: [
            // Difficulty level progress view
            Container(
              height: size.height / 8,
              color: Colors.deepPurple[700],
            ),
            // Challenge questions view
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$numOne + $numTwo = ',
                      style: whiteTextColor,
                    ),
                    Container(
                      height: size.height / 11,
                      width: size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[600],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Keypad for the challenge
            Expanded(
              flex: 2,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numberPad.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return Keys(
                    keyValue: numberPad[index],
                    function: () => buttonTap(numberPad[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

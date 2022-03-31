import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class ChooseQuiz extends StatelessWidget {
  final List<String> quizes;
  final Function chooseQuizFunction;

  const ChooseQuiz({
    required this.quizes,
    required this.chooseQuizFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Question(
              "Choose which quiz you want to take",
            ),
            ...quizes.map((answer) {
              int i = 0;
              while (i < quizes.length) {
                if (quizes[i] == answer) {
                  break;
                }
                i++;
              }
              return Answer(() => chooseQuizFunction(i + 1), answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  const Quiz(
      {required this.answerQuestion,
      required this.questions,
      required this.questionIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        heightFactor: 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            Question(
              (questionIndex + 1).toString() +
                  "." +
                  questions[questionIndex]["question"].toString(),
            ),
            ...(questions[questionIndex]["answers"]
                    as List<Map<String, Object>>)
                .map((answer) {
              return Answer(() => answerQuestion(answer["score"]),
                  (answer["text"] as String));
            }).toList(),
          ],
        ),
      ),
    );
  }
}

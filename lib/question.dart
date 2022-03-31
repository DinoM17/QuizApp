import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(20),
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
        maxLines: 4,
      ),
    );
  }
}

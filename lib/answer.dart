import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback dinoHandler;
  final String answerText;
  const Answer(this.dinoHandler, this.answerText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: dinoHandler,
        child: Text(
          answerText,
        ),
      ),
    );
  }
}

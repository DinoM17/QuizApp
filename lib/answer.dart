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
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
            side: const BorderSide(
              color: Colors.red,
              style: BorderStyle.solid,
              width: 3.0,
            ),
          )),
        ),
        onPressed: dinoHandler,
        child: Text(
          answerText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Reward extends StatelessWidget {
  final VoidCallback resetQuiz;
  const Reward({required this.resetQuiz, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        heightFactor: 1.5,
        child: Column(
          children: [
            Image.asset(
              "assets/images/dinosaurus.jpg",
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: resetQuiz,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
              child: const Text(
                "Restart the Quiz",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

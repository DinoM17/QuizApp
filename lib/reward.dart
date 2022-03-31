import 'package:flutter/material.dart';

class Reward extends StatelessWidget {
  final VoidCallback resetQuiz;
  final String rewardImagePath;
  final String rewardText;
  const Reward({
    required this.resetQuiz,
    required this.rewardImagePath,
    required this.rewardText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        heightFactor: 1.5,
        child: Column(
          children: [
            Image.asset(
              rewardImagePath,
              width: double.infinity,
              height: 300,
            ),
            (rewardText != "")
                ? Text(
                    rewardText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  )
                : const SizedBox(
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

import 'package:flutter/material.dart';

class Reward extends StatelessWidget {
  final VoidCallback resetQuiz;
  final chosenQuiz;
  const Reward({required this.resetQuiz, required this.chosenQuiz, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        heightFactor: 1.5,
        child: Column(
          children: [
            (chosenQuiz == 1)
                ? Image.asset(
                    "assets/images/dinosaurus.jpg",
                    width: double.infinity,
                    height: 300,
                  )
                : Image.asset(
                    "assets/images/rose.jpg",
                    width: double.infinity,
                    height: 300,
                  ),
            (chosenQuiz == 2)
                ? const Text(
                    "Happy 8 March Baby!!!",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                : (chosenQuiz == 3)
                    ? const Text(
                        "Can't wait to see you BABYYY!!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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

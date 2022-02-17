import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int numberOfQuestions;
  final VoidCallback rewardFunction;
  const Result(
      {required this.rewardFunction,
      required this.resultScore,
      required this.numberOfQuestions,
      Key? key})
      : super(key: key);

  String get resultPhrase {
    String text = "End result $resultScore/$numberOfQuestions\n";
    if (resultScore != numberOfQuestions) {
      text += "Not perfect but you still chose your man correctly.\n";
    } else {
      text += "Perfect result.\n";
    }
    return text;
  }

  String get imageLocation {
    String text;
    if (resultScore / numberOfQuestions < 0.4) {
      text = "assets/images/badImage.jpeg";
    } else if (resultScore / numberOfQuestions > 0.7) {
      text = "assets/images/coolImage.jpg";
    } else {
      text = "assets/images/okImage.jpg";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        heightFactor: 1.5,
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
            Image.asset(
              imageLocation,
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: rewardFunction,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
              child: const Text(
                "Take your reward",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

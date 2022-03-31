import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final int numberOfQuestions;
  final VoidCallback rewardFunction;
  final String negativeResultText;
  final String notPerfectResultText;
  final String negativeResultImage;
  final String badResultImage;
  final String okResultImage;
  final String bestResultImage;
  final String perfectResultText;
  const Result(
      {required this.rewardFunction,
      required this.resultScore,
      required this.numberOfQuestions,
      required this.negativeResultText,
      required this.notPerfectResultText,
      required this.perfectResultText,
      required this.negativeResultImage,
      required this.badResultImage,
      required this.bestResultImage,
      required this.okResultImage,
      Key? key})
      : super(key: key);

  String get resultPhrase {
    String text = "End result $resultScore/$numberOfQuestions\n";
    if (resultScore != numberOfQuestions) {
      if (resultScore < 0) {
        text = negativeResultText;
      } else {
        text += notPerfectResultText;
      }
    } else {
      text += perfectResultText;
    }
    return text;
  }

  String get imageLocation {
    String text;
    if (resultScore < 0) {
      text = negativeResultImage;
    } else if (resultScore / numberOfQuestions < 0.4) {
      text = badResultImage;
    } else if (resultScore / numberOfQuestions > 0.7) {
      text = bestResultImage;
    } else {
      text = okResultImage;
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

import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';
import 'package:quiz/reward.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "question": "What's Dino's favourite colour?",
      "answers": [
        {"text": "Black", "score": 0},
        {"text": "Red", "score": 1},
        {"text": "Blue", "score": 0},
        {"text": "Green", "score": 0},
      ],
    },
    {
      "question": "What's Dino's favourite animal?",
      "answers": [
        {"text": "Dinosaurus", "score": 0},
        {"text": "Cat", "score": 0},
        {"text": "Lion", "score": 1},
        {"text": "Dog", "score": 0},
      ],
    },
    {
      "question": "What's Dino's favourite football club?",
      "answers": [
        {"text": "Atletic Bilbao", "score": 0},
        {"text": "Atletico Madrid", "score": 0},
        {"text": "Real Madrid", "score": 0},
        {"text": "Barcelona", "score": 1},
      ],
    },
    {
      "question": "What's Dino's favourite meal?",
      "answers": [
        {"text": "Riza sa piletinom", "score": 0},
        {"text": "Pohovane snicle", "score": 1},
        {"text": "Janjetina", "score": 0},
        {"text": "Grah", "score": 0},
      ],
    },
    {
      "question": "What's Dino's favourite anime?",
      "answers": [
        {"text": "One Piece", "score": 0},
        {"text": "Dragon ball", "score": 1},
        {"text": "Naruto", "score": 0},
        {"text": "Bleach", "score": 0},
      ],
    },
    {
      "question": "Who's your favourite man?",
      "answers": [
        {"text": "Dino", "score": 1},
        {"text": "Dino", "score": 1},
        {"text": "Dino", "score": 1},
        {"text": "Dino", "score": 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  var _rewardScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _rewardScore = 0;
    });
  }

  void _rewardFun() {
    setState(() {
      _rewardScore = 1;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex++);
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset("assets/images/dinosaurus.jpg").image, context);
    precacheImage(Image.asset("assets/images/badImage.jpg").image, context);
    precacheImage(Image.asset("assets/images/coolImage.jpg").image, context);
    precacheImage(Image.asset("assets/images/okImage.jpg").image, context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dino quiz"),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : (_rewardScore == 0)
                ? Result(
                    rewardFunction: _rewardFun,
                    resultScore: _totalScore,
                    numberOfQuestions: _questions.length,
                  )
                : Reward(
                    resetQuiz: _resetQuiz,
                  ),
      ),
    );
  }
}

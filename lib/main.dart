import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';
import 'package:quiz/reward.dart';
import 'package:quiz/chooseQuiz.dart';
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
  final _quizList = const [
    "Dino Quiz",
    "After Sweden Quiz",
    "Before Germany Quiz",
  ];
  final quizes = const [
    {
      "After Sweden Quiz": [
        {
          "question": "In which city does Dino live?",
          "answers": [
            {"text": "Stockholm", "score": 0},
            {"text": "Västerås", "score": 1},
            {"text": "Skavsta", "score": 0},
            {"text": "Norrköping", "score": 0},
          ],
        },
        {
          "question": "What is the name of the lake where Dino lives?",
          "answers": [
            {"text": "Vättern", "score": 0},
            {"text": "Vänern", "score": 0},
            {"text": "Mälaren", "score": 1},
            {"text": "Siljan", "score": 0},
          ],
        },
        {
          "question": "Where are the shopping centers?",
          "answers": [
            {"text": "Erikslund", "score": 1},
            {"text": "Eriksburg", "score": 0},
            {"text": "Eskilstuna", "score": 0},
            {"text": "Haga", "score": 0},
          ],
        },
        {
          "question": "With which car did Dino pick you up?",
          "answers": [
            {"text": "VW Golf", "score": 0},
            {"text": "Opel Corsa", "score": 1},
            {"text": "Pegueot", "score": 0},
            {"text": "BMW", "score": 0},
          ],
        },
        {
          "question": "Would you come again?",
          "answers": [
            {"text": "Yes", "score": 1},
            {"text": "Yes", "score": 1},
            {"text": "Yes", "score": 1},
            {"text": "no", "score": -10},
          ],
        },
      ],
      "Dino Quiz": [
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
      ],
      "Before Germany Quiz": [
        {
          "question": "When is Lejla going to Germany?",
          "answers": [
            {"text": "1st of April (Not a joke)", "score": 1},
            {"text": "3rd of April", "score": 0},
            {"text": "31st of March", "score": 0},
            {"text": "2nd of April", "score": 0},
          ],
        },
        {
          "question": "Where is Lejla going?",
          "answers": [
            {"text": "Berlin", "score": 0},
            {"text": "Brussels", "score": 0},
            {"text": "All of the above", "score": 1},
            {"text": "None of the above", "score": 0},
          ],
        },
        {
          "question": "Is she gonna rock there?",
          "answers": [
            {"text": "Yeah", "score": 1},
            {"text": "Absolutely", "score": 1},
            {"text": "F**k yeah", "score": 1},
            {"text": "B***h please", "score": 1},
          ],
        },
        {
          "question": "What is the name of the kreten going with Lejla?",
          "answers": [
            {"text": "Mehmed", "score": 1},
            {"text": "Aldin", "score": 0},
            {"text": "Dino", "score": -999999},
            {"text": "Kreten", "score": 1},
          ],
        },
        {
          "question": "What is our favourite Christian holiday this year?",
          "answers": [
            {"text": "Christmas", "score": 0},
            {"text": "Krsna slava", "score": 0},
            {"text": "Easter", "score": 1},
            {"text": "Ne znam vise hahahh", "score": 0},
          ],
        },
        {
          "question": "When is my baby coming?",
          "answers": [
            {"text": "Sometime in June", "score": 0},
            {"text": "20th of April", "score": 0},
            {"text": "10th of April", "score": 0},
            {"text": "14th of April", "score": 1},
          ],
        },
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  var _rewardScore = 0;
  var _chosenQuiz = 0;
  List<Map<String, Object>> _questions = [];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _rewardScore = 0;
      _chosenQuiz = 0;
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

  void _chooseQuiz(int quizNumber) {
    setState(() {
      _chosenQuiz = quizNumber;
      _questions =
          quizes[0][_quizList[quizNumber - 1]] as List<Map<String, Object>>;
    });
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset("assets/images/dinosaurus.jpg").image, context);
    precacheImage(Image.asset("assets/images/badImage.jpg").image, context);
    precacheImage(Image.asset("assets/images/coolImage.jpg").image, context);
    precacheImage(Image.asset("assets/images/okImage.jpg").image, context);
    precacheImage(Image.asset("assets/images/rose.jpg").image, context);
    precacheImage(Image.asset("assets/images/angryImage.jpg").image, context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quizes"),
          centerTitle: true,
        ),
        body: (_chosenQuiz == 0)
            ? ChooseQuiz(
                quizes: _quizList,
                chooseQuizFunction: _chooseQuiz,
              )
            : (_questionIndex < _questions.length)
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
                        chosenQuiz: _chosenQuiz,
                      ),
      ),
    );
  }
}

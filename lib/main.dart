import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';
import 'package:quiz/reward.dart';
import 'package:quiz/chooseQuiz.dart';
import 'package:quiz/quizInfo.dart';
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
  var _questionIndex = 0;
  var _totalScore = 0;
  var _rewardScore = 0;
  var _chosenQuiz = 0;
  List<Map<String, Object>> _questions = [];
  String _rewardImagePath = "";
  String _rewardText = "";
  String _perfectResultText = "";
  String _notPerfectResultText = "";
  String _negativeResultText = "";
  String _negativeResultImage = "";
  String _okResultImage = "";
  String _badResultImage = "";
  String _bestResultImage = "";

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
      _questions = QuizInfo.quizes[QuizInfo.quizList[quizNumber - 1]]!["quiz"]
          as List<Map<String, Object>>;
      _rewardImagePath = QuizInfo
          .quizes[QuizInfo.quizList[quizNumber - 1]]!["rewardImage"] as String;
      _rewardText = QuizInfo
          .quizes[QuizInfo.quizList[quizNumber - 1]]!["rewardText"] as String;
      _perfectResultText = QuizInfo
              .quizes[QuizInfo.quizList[quizNumber - 1]]!["perfectResultText"]
          as String;
      _notPerfectResultText = QuizInfo.quizes[
          QuizInfo.quizList[quizNumber - 1]]!["notPerfectResultText"] as String;
      _negativeResultText = QuizInfo
              .quizes[QuizInfo.quizList[quizNumber - 1]]!["negativeResultText"]
          as String;
      _negativeResultImage = QuizInfo
              .quizes[QuizInfo.quizList[quizNumber - 1]]!["negativeResultImage"]
          as String;
      _okResultImage =
          QuizInfo.quizes[QuizInfo.quizList[quizNumber - 1]]!["okResultImage"]
              as String;
      _badResultImage =
          QuizInfo.quizes[QuizInfo.quizList[quizNumber - 1]]!["badResultImage"]
              as String;
      _bestResultImage =
          QuizInfo.quizes[QuizInfo.quizList[quizNumber - 1]]!["bestResultImage"]
              as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> _allImages = [];
    for (var i = 0; i < QuizInfo.quizList.length; i++) {
      if (!_allImages
          .contains(QuizInfo.quizes[QuizInfo.quizList[i]]!["rewardImage"])) {
        _allImages.add(
            QuizInfo.quizes[QuizInfo.quizList[i]]!["rewardImage"] as String);
      }
      if (!_allImages.contains(
          QuizInfo.quizes[QuizInfo.quizList[i]]!["bestResultImage"])) {
        _allImages.add(QuizInfo.quizes[QuizInfo.quizList[i]]!["bestResultImage"]
            as String);
      }
      if (!_allImages
          .contains(QuizInfo.quizes[QuizInfo.quizList[i]]!["badResultImage"])) {
        _allImages.add(
            QuizInfo.quizes[QuizInfo.quizList[i]]!["badResultImage"] as String);
      }
      if (!_allImages
          .contains(QuizInfo.quizes[QuizInfo.quizList[i]]!["okResultImage"])) {
        _allImages.add(
            QuizInfo.quizes[QuizInfo.quizList[i]]!["okResultImage"] as String);
      }
      if (!_allImages.contains(
          QuizInfo.quizes[QuizInfo.quizList[i]]!["negativeResultImage"])) {
        _allImages.add(QuizInfo
            .quizes[QuizInfo.quizList[i]]!["negativeResultImage"] as String);
      }
    }
    for (var i in _allImages) {
      precacheImage(Image.asset(i).image, context);
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quizes"),
          centerTitle: true,
        ),
        body: (_chosenQuiz == 0)
            ? ChooseQuiz(
                quizes: QuizInfo.quizList,
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
                        badResultImage: _badResultImage,
                        bestResultImage: _bestResultImage,
                        okResultImage: _okResultImage,
                        perfectResultText: _perfectResultText,
                        notPerfectResultText: _notPerfectResultText,
                        negativeResultImage: _negativeResultImage,
                        negativeResultText: _negativeResultText,
                      )
                    : Reward(
                        resetQuiz: _resetQuiz,
                        rewardImagePath: _rewardImagePath,
                        rewardText: _rewardText,
                      ),
      ),
    );
  }
}

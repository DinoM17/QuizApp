# quiz

# Add new pictures
    Place them into assets\images folder.

# Add new Quiz
Go into quizInfo.dart
In quizList line 2 add the name of new Quiz. Look at the already existing and add them in the same manner.
Template for new quiz:
# Starts Here
static const _nameOfTheQuizWithoutSpaces = {
    "quiz": [
        ¤Copy from line bellow
      {
        "question": "Type a question",
        "answers": [
          {"text": "Type first answer", "score": Type numerically how many points the answer carries, examples bellow},
          {"text": "Type second answer", "score": 0},
          {"text": "Type third answer", "score": 1},
          {"text": "Type fourth answer", "score": -10},
        ],
      },
      ... copy until this line as many times to create more questions
    ],
    "rewardImage": "assets/images/nameOfTheRewardPicture",
    "rewardText": "Type reward text",
    "bestResultImage": "assets/images/nameOfTheBestResultPicture",
    "badResultImage": "assets/images/nameOfTheBadResultPicture",
    "okResultImage": "assets/images/nameOfTheOkResultPicture",
    "negativeResultImage": "assets/images/nameOfTheNegativeResultPicture",
    "negativeResultText": "Type negative result text (leave \n at the end) \n",
    "notPerfectResultText": "Type not perfect result text (leave \n at the end) \n",
    "perfectResultText": "Type perfect result text (leave \n at the end) \n",
  };
# Ends Here
In quizes at the end of the file add line
"Name of the quiz": _nameOfTheQuizWithourSpaces,
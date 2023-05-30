import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  //questtion index
  var currentQuesIndex = 0;
  final List<String> answers = [];

  void answerQuestion(String answer) {
    answers.add(answer);
    setState(() {
      if (questions.length > currentQuesIndex + 1) {
        currentQuesIndex++;
      } else {
        activeScreen = 'result-screen';
      }
    });
  }
  // @override
  // void initState() {
  //   activeScreen = StartScreen(startQuiz: switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-string';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);

    if (activeScreen == 'question-string') {
      screenWidget = QuestionsScreen(
        answerQuestion: answerQuestion,
        currentQuesIndex: currentQuesIndex,
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: answers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 50, 3, 58),
              Color.fromARGB(255, 108, 7, 126)
            ],
          )),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}

// It could be done using 3 methods 
//  - initState()
//  - using ternary operator
//  - if - else
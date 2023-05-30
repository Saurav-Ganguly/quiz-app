import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/result_screen/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'user_answer': chosenAnswers[i],
          'correct_answer': questions[i].answers[questions[i].correctAns]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final summaryData = getSummaryData();
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your have $numCorrectQuestions questions right out of $numTotalQuestions questions.",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(height: 30),
          SizedBox(
              height: 400,
              child: QuestionsSummary(
                summaryData: summaryData,
              )),
          const SizedBox(
            height: 30,
          ),
          TextButton(onPressed: () {}, child: const Text("Restart Quiz! "))
        ],
      ),
    );
  }
}

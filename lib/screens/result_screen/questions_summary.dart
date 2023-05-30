import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_screen/question_index.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    // gives a itirable -> which can be converted to list by using .toList()

    return SingleChildScrollView(
      child: Column(
        children: summaryData.map((data) {
          bool isCorrect = false;
          if (data['user_answer'] == data['correct_answer']) {
            isCorrect = true;
          }
          const Color rightColor = Color.fromARGB(255, 87, 172, 90);
          //final Color wrongColor = const Color.fromARGB(255, 235, 121, 121);
          return Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // type casting
                QuestionIndex(
                  isCorrect: isCorrect,
                  quesIndex: (data['question_index'] as int),
                ),
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: rightColor, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

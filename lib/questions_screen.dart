import 'package:flutter/material.dart';
import 'package:quiz_app/ans_btn.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQues = questions[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentQues.text,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        // map over the ans -> then spread the data in the chidren
        ...currentQues.answers.map((answer) {
          return AnsBtn(
            ansText: answer,
            selectAns: () {},
          );
        }),
      ],
    );
  }
}

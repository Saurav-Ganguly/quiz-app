import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/ans_btn.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final int currentQuesIndex;
  final void Function(String) answerQuestion;

  const QuestionsScreen(
      {required this.currentQuesIndex,
      required this.answerQuestion,
      super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQues = questions[widget.currentQuesIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            currentQues.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 186, 183, 243),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 30),
          // map over the ans -> then spread the data in the chidren
          ...currentQues.getShuffledAnswers().map((answer) {
            return AnsBtn(
              ansText: answer,
              selectAns: () {
                widget.answerQuestion(answer);
              },
            );
          }),
        ],
      ),
    );
  }
}

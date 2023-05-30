import 'package:flutter/material.dart';

class QuestionIndex extends StatelessWidget {
  final bool isCorrect;
  final int quesIndex;
  const QuestionIndex({
    super.key,
    required this.isCorrect,
    required this.quesIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCorrect
            ? const Color.fromARGB(255, 100, 240, 172)
            : const Color.fromARGB(255, 243, 120, 111),
      ),
      child: Text(
        (quesIndex + 1).toString(),
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

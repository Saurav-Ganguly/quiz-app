import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main(List<String> args) {
  runApp(
    const MainScreen(),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}

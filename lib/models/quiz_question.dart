class QuizQuestion {
  //adding the const as the question once created will not be changed
  const QuizQuestion({
    required this.text,
    required this.answers,
    required this.correctAns,
  });

  final String text;
  final List<String> answers;
  final int correctAns;
}

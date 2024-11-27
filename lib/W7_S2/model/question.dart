class Question {
  final String title;
  final List<String> possibleAnswers;
  final String goodAnswer;

  const Question(
    {required this.title,
     required this.possibleAnswers, 
     required this.goodAnswer});
}
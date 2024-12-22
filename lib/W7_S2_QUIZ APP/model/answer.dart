

import 'package:flutter_term1/W7_S2_QUIZ%20APP/model/quiz.dart';

class Answer {
  final String questionAnswer;
  final Question question;

  Answer({
    required this.questionAnswer,
    required this.question,
  });

  // use bool
   bool get isCorrect => questionAnswer == question.goodAnswer;

  // A fallback empty answer
  static Answer empty() {
    return Answer(
      question:
       Question(
        title: '',
        possibleAnswers: [],
        goodAnswer: ''), 
        questionAnswer: '');
  }
}


import 'package:flutter_term1/W7_S2/model/quiz.dart';

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
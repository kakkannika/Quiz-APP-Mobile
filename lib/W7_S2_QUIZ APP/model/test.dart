// import 'package:flutter_term1/W7_S2/model/quiz.dart';
// import 'package:flutter_term1/W7_S2/model/submission.dart';

// void main(){
//     const  Question question1 = Question(
//     title: "What is Dart ?",
//      possibleAnswers: ["Programming Language","Framework","Library"],
//       goodAnswer: "Programming Language",
//       );
//     const  Question  question2 = Question(
//       title: "What is Flutter ?", 
//       possibleAnswers: ["Library","Framework","Language"],
//        goodAnswer:"Framework",
//        );
//     Submission submission = Submission();

//     submission.addAnswer(question1, "Programming Language");
//     submission.addAnswer(question2, "Library");

//     print("Answer for question1: ${submission.getAnswerFor(question1)?.questionAnswer}");
//     print("Answer for Question 2 : ${submission.getAnswerFor(question2)?.questionAnswer}");

//     print("Score: ${submission.getScore()}");

//     submission.removeAnswers();

//     print("Score after clearing answer: ${submission.getScore()}");

// }
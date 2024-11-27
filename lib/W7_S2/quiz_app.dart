import 'package:flutter/material.dart';
import 'package:flutter_term1/W7_S2/model/quiz.dart';
import 'package:flutter_term1/W7_S2/model/submission.dart';
import 'package:flutter_term1/W7_S2/screens/question_screen.dart';
import 'package:flutter_term1/W7_S2/screens/result_screen.dart';
import 'package:flutter_term1/W7_S2/screens/welcome_screen.dart';
import 'package:flutter_term1/W7_S2/model/answer.dart';

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp({required this.quiz, super.key});

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  int currentQuestionIndex = 0;
  late Submission _submission;

  @override
  void initState() {
    super.initState();
    _submission = Submission();  // Initialize the Submission object
  }

  // Start the quiz
  void _startQuiz() {
    setState(() {
      _quizState = QuizState.started;
    });
  }

  // Move to the next question
  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _finishQuiz();
      }
    });
  }

  // Finish the quiz
  void _finishQuiz() {
    setState(() {
      _quizState = QuizState.finished;
    });
  }

  // Restart the quiz
  void _resetQuiz() {
    setState(() {
      _quizState = QuizState.notStarted;
      currentQuestionIndex = 0;
      _submission.removeAnswers();  // Clear all answers
    });
  }

  // Handle user answer selection
  void _onAnswerSelected(String answer) {
    Question currentQuestion = widget.quiz.questions[currentQuestionIndex];
    Answer userAnswer = Answer(question: currentQuestion, questionAnswer: answer);
    _submission.addAnswer(userAnswer);
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    switch (_quizState) {
      case QuizState.notStarted:
        currentScreen = WelcomeScreen(
          onStart: _startQuiz,
          quizTitle: widget.quiz.title,
        );
        break;

      case QuizState.started:
        currentScreen = QuestionScreen(
          question: widget.quiz.questions[currentQuestionIndex],
          onTap: _onAnswerSelected, // Pass _onAnswerSelected to handle answer selection
        );
        break;

      case QuizState.finished:
        currentScreen = ResultScreen(
          onReset: _resetQuiz,
          submission: _submission,
          quiz: widget.quiz,
        );
        break;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[500],
        body: currentScreen, // Display current screen based on quiz state
      ),
    );
  }
}

enum QuizState { notStarted, started, finished }

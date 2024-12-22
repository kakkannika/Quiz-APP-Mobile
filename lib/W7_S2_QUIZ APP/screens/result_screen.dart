import 'package:flutter/material.dart';
import 'package:flutter_term1/W7_S2_QUIZ%20APP/model/quiz.dart';
import 'package:flutter_term1/W7_S2_QUIZ%20APP/model/submission.dart';
import 'package:flutter_term1/W7_S2_QUIZ%20APP/model/answer.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onReset;
  final Submission submission;
  final Quiz quiz;

  const ResultScreen({
    required this.onReset,
    required this.submission,
    required this.quiz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the score (number of correct answers)
    int score = submission.getScore();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title with score
            Text(
              "Quiz Completed!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 15),
            Text(
              "You answered $score out of ${quiz.questions.length} correctly.",
              style: TextStyle(fontSize: 20, color: Colors.blue[700]),
            ),
            SizedBox(height: 30),

            // Display each question, answer, and whether it was correct
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  Question question = quiz.questions[index];
                  String userAnswer = submission.getAnswerFor(question)?.questionAnswer ?? 'No answer';
                  bool isCorrect = userAnswer == question.goodAnswer;

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.green[100] : Colors.red[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isCorrect ? Colors.green : Colors.red,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ${question.title}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Your answer: $userAnswer',
                          style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Correct answer: ${question.goodAnswer}',
                          style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                        ),
                        SizedBox(height: 8),
                        isCorrect
                            ? Icon(Icons.check_circle, color: Colors.green, size: 30)
                            : Icon(Icons.cancel, color: Colors.red, size: 30),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Restart Quiz Button with Icon
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: onReset,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.blue[900],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh, color: Colors.white, size: 24), // Restart Icon
                    SizedBox(width: 10),
                    Text(
                      'Restart Quiz',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

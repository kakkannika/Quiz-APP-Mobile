import 'package:flutter/material.dart';
import 'package:flutter_term1/W7_S2_QUIZ%20APP/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  final Function(String) onTap;
  final Question question;

  const QuestionScreen({
    required this.onTap,
    required this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Question title
            Text(
              question.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            // Display the answer options as buttons
            ...question.possibleAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      onTap(answer); // Pass the selected answer
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[300],
                    ),
                    child: Text(
                      answer,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

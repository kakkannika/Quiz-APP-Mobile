import 'quiz.dart';
import 'answer.dart';
class Submission {
  final List<Answer> answers = [];

  // Add an answer to the list
  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  // Get the score (number of correct answers)
  int getScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.isCorrect) {
        score++;
      }
    }
    return score;
  }

  // Get the answer for a specific question
  Answer? getAnswerFor(Question question) {
    return answers.firstWhere((answer) => answer.question == question, orElse: () => Answer.empty());
  }

  // Clear all answers
  void removeAnswers() {
    answers.clear();
  }
}

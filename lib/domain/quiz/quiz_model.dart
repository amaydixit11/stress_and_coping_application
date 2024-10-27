// quiz_model.dart
import 'package:stress_and_coping_application/domain/quiz/question_model.dart';

class Quiz {
  final String title;
  final String summary;
  final List<dynamic> answers;
  final List<dynamic> resultsTitle;
  final List<dynamic> resultsDescription;
  // final String instruction;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.summary,
    required this.answers,
    required this.resultsTitle,
    required this.resultsDescription,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      title: json['title'],
      summary: json['summary'],
      answers: json['answers'],
      resultsTitle: json['resultsTitle'],
      resultsDescription: json['resultsDescription'],
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }
}

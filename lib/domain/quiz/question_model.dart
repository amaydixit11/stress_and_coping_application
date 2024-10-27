// question_model.dart
class Question {
  final String question;
  final List<String> options;

  Question({
    required this.question,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: (json['options'] as Map<String, dynamic>)
          .values
          .toList()
          .cast<String>(),
    );
  }
}

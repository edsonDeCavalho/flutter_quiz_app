import 'Question.dart';

class Quiz {
  List<Question> questions;

  Quiz({required this.questions});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var questionsList = json['questions'] as List;
    List<Question> questions = questionsList.map((q) => Question.fromJson(q)).toList();

    return Quiz(questions: questions);
  }
}
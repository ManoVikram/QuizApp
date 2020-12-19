import 'dart:convert' show json;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class QuizData {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> choice;

  QuizData({
    @required this.category,
    @required this.type,
    @required this.difficulty,
    @required this.question,
    @required this.correctAnswer,
    @required this.choice,
  });
}

class Quiz with ChangeNotifier {
  List<QuizData> _questions = [];

  List<QuizData> get questions {
    return [..._questions];
  }

  Future<void> fetchQuestions() async {
    final String url = "https://opentdb.com/api.php?amount=30";

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return;
    }

    final List<QuizData> loadedData = [];
    for (var quiz in extractedData["results"]) {
      List<dynamic> allAnswers = quiz["incorrect_answers"];
      print(allAnswers);
      allAnswers.add(quiz["correct_answer"]);
      allAnswers.shuffle();

      loadedData.add(
        QuizData(
          category: quiz["category"],
          type: quiz["type"],
          difficulty: quiz["difficulty"],
          question: quiz["question"],
          correctAnswer: quiz["correct_answer"],
          choice: allAnswers,
        ),
      );
      _questions = loadedData;
      notifyListeners();
    }
  }
}

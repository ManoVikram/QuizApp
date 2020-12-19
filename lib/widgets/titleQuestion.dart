import 'package:flutter/material.dart';

import '../models/quiz.dart';

class TitleQuestion extends StatelessWidget {
  final QuizData question;

  TitleQuestion({this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChip(
                  backgroundColor: Colors.blueGrey[100],
                  label: Text(question.category),
                  onSelected: (value) {},
                ),
                SizedBox(
                  width: 10,
                ),
                FilterChip(
                  backgroundColor: Colors.blueGrey[100],
                  label: Text(question.difficulty),
                  onSelected: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

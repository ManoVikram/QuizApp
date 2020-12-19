import 'package:flutter/material.dart';

class Answers extends StatefulWidget {
  final String answer;
  final String correctAnswer;

  Answers({
    this.answer,
    this.correctAnswer,
  });

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.answer == widget.correctAnswer) {
            textColor = Colors.green;
          } else {
            textColor = Colors.red;
          }
        });
      },
      title: Text(
        widget.answer,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

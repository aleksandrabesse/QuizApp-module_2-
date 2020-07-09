import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  @override
  final List<Map<String, Object>> questions;
  final int index;
  final Function action;

  Quiz({@required this.questions, @required this.index, @required this.action});

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(questions[index]['question']),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              action: () => action(answer['score']),
              answerText: answer['text']);
        }).toList()
      ],
    );
  }
}

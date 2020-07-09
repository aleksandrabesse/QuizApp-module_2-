import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Blue', 'score': 6},
        {'text': 'White', 'score': 9},
        {'text': 'Green', 'score': 10}
      ]
    },
    {
      'question': 'What\'s your favourite movie?',
      'answers': [
        {'text': 'Greedy', 'score': 5},
        {'text': 'The Addams family', 'score': 6},
        {'text': 'Klaus', 'score': 9},
        {'text': 'Frozen', 'score': 10}
      ]
    },
    {
      'question': 'What\'s your favourite person?',
       'answers': [
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 5}
       ]
    },
  ];
  int _index = 0;
  int _totalScore=0;

  void _answer(score) {
    _totalScore+=score;
    setState(() {
      _index += 1;
    });
  }

  String get textResult
  {
    if (_totalScore>15)
      return 'You OK';
    else if (_totalScore > 20)
      return 'You good';
    else if (_totalScore>30)
      return 'Good boy';
    return 'You did it';
  }

  void start()
  {
    setState(() {
      _totalScore=0;
      _index=0;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz app',
          textAlign: TextAlign.center,
        ),
      ),
      body: _index < _questions.length
          ? Quiz(
              action: _answer ,
              index: _index,
              questions: _questions,
            )
          : Result(start: start,textResult: textResult,),
    ));
  }
}

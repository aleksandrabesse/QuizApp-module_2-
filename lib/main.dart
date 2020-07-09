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
      'question': 'Ты сегодня гуляла долго?',
      'answers': [
        {'text': 'Да', 'score': 0},
        {'text': 'Нет', 'score': 5},
      ]
    },
    {
      'question':
          'Ты сегодня встречалась с кем - то или общалась через голосовой чат?',
      'answers': [
        {'text': 'Да', 'score': 0},
        {'text': 'Нет', 'score': 4},
      ]
    },
    {
      'question': 'Чем ты занималась сегодня?',
      'answers': [
        {'text': 'Смотрела сериалы', 'score': 3},
        {'text': 'Читала книгу', 'score': 2},
        {'text': 'Смотрела телевизор', 'score': 3},
        {'text': 'Гуляла', 'score': 0},
        {'text': 'Смотрела уроки', 'score': 1}
      ]
    },
  ];
  int _index = 0;
  int _totalScore = 0;

  void _answer(score) {
    _totalScore += score;
    setState(() {
      _index += 1;
    });
  }

  String get textResult {
    if (_totalScore == 12)
      return 'Слетишь';
    else if (_totalScore > 6)
      return 'Возможно слетишь, осторожнее';
    else if (_totalScore > 2)
      return 'Малая вероятность слета, но давай без глупостей';
    return 'Все прекрасно';
  }

  void start() {
    setState(() {
      _totalScore = 0;
      _index = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          'Анализатор',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
      ),
      body: _index < _questions.length
          ? Quiz(
              action: _answer,
              index: _index,
              questions: _questions,
            )
          : Result(
              start: start,
              textResult: textResult,
            ),
    ));
  }
}

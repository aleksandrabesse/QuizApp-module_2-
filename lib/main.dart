import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './quiz.dart';
import './result.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      'question':
          'Чтобы алгоритм бинарного поиска работал правильно, нужно, чтобы массив (список) был:',
      'answers': [
        {'text': 'Отсортированным', 'score': 1},
        {'text': 'Несортированным', 'score': 0},
        {'text': 'В куче', 'score': 0},
        {'text': 'Выходящим из стека', 'score': 0}
      ]
    },
    {
      'question':
          'Алгоритм обхода графа отличается от алгоритма обхода вершин дерева тем, что…',
      'answers': [
        {'text': 'Деревья не соединяются', 'score': 0},
        {'text': 'Графы могут иметь циклы', 'score': 1},
        {'text': 'У деревьев есть корни', 'score': 0},
        {
          'text': 'Все утверждения выше ошибочны: дерево — подмножество графа',
          'score': 0
        }
      ]
    },
    {
      'question':
          'Какой алгоритм из нижеперечисленных будет самым производительным, если дан уже отсортированный массив?',
      'answers': [
        {'text': 'Сортировка слиянием', 'score': 0},
        {'text': 'Сортировка вставками', 'score': 1},
        {'text': 'Быстрая сортировка', 'score': 0},
        {'text': 'Пирамидальная сортировка', 'score': 0}
      ]
    },
    {
      'question': 'Алгоритм Дейкстры основан на:',
      'answers': [
        {'text': 'Парадигме «разделяй и властвуй»', 'score': 0},
        {'text': 'Динамическом программировании', 'score': 0},
        {'text': 'Жадном подходе (Greedy Approach)', 'score': 1},
        {'text': 'Поиске с возвратом', 'score': 0}
      ]
    }
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
    if (_totalScore == 4)
      return 'Абсолютно верно';
    else if (_totalScore > 2) return 'Подумай над некоторыми вопросами еще раз';
    return 'Неверно, посмотри теорию еще раз';
  }

  void start() {
    setState(() {
      _totalScore = 0;
      _index = 0;
    });
  }

  final ObstructingPreferredSizeWidget iosAppBar = CupertinoNavigationBar(
    middle: const Text(
      'Тест',
    ),
  );
  final appBar = AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title: const Text(
        'Тест',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ));
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Platform.isIOS? CupertinoThemeData(
         scaffoldBackgroundColor: CupertinoColors.black,
      ):
      ThemeData(
primaryColor: Colors.green,
      ),
        home: Platform.isIOS
            ? CupertinoPageScaffold(
                navigationBar: iosAppBar,
                child: _index < _questions.length
                    ? Quiz(
                        action: _answer,
                        index: _index,
                        questions: _questions,
                      )
                    : Result(
                        start: start,
                        textResult: textResult,
                      ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  centerTitle: true,
                  title: const Text(
                    'Тест',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
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

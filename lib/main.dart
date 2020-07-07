import 'package:flutter/material.dart';

import "./question.dart";

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
  var listOfQuestions = ['First question', 'Second question'];

  List listOfVar = ['1', '2', '3'];
  int _index = 0;

  void _answer() {
    setState(() {
      _index==1?_index=0:_index=1;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz app'),
      ),
      body: Column(
        children: <Widget>[
          Question(listOfQuestions[_index]),
          RaisedButton(
            child: Text('V1'),
            onPressed: _answer,
          ),
          RaisedButton(
            child: Text('V2'),
            onPressed: _answer,
          ),
          RaisedButton(
            child: Text('V3'),
            onPressed: _answer,
          ),
        ],
      ),
    ));
  }
}

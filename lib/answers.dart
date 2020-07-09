import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function action;

  Answer({this.answerText, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        child:  RaisedButton(
          color: Colors.green[400],
            child: Text(answerText, style: TextStyle(fontWeight: FontWeight.w600, color:Colors.white)),
            onPressed: action,
          ),
   
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Answer extends StatelessWidget {
  final String answerText;
  final Function action;

  Answer({this.answerText, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Platform.isIOS
          ? CupertinoButton(
              child: Text(answerText,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                  textAlign: TextAlign.center),
              onPressed: action,
              color: Theme.of(context).primaryColor,
            )
          : RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                answerText,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: action,
            ),
    );
  }
}

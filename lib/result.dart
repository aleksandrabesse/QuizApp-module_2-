import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final String textResult;
  final Function start;
  Result({this.textResult, this.start});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child:  Text(
            textResult,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
        Platform.isIOS
            ? CupertinoButton(
                child: const Text('Пройти заново'), onPressed: start)
            : FlatButton(
                child: const Text(
                  'Пройти заново',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                onPressed: start,
              )
      ],
    );
  }
}

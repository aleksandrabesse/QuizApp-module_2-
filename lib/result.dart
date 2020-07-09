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
          child: Text(
            textResult,
            style: TextStyle(color: Colors.green[400], fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text(
            'Пройти заново',
            style: TextStyle(fontSize: 15, color: Colors.grey[600],fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          onPressed: start,
        )
      ],
    );
  }
}

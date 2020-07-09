import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final String textResult;
  final Function start;
  Result({this.textResult,this.start});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            textResult,
            style: TextStyle(color: Colors.blue, fontSize: 25),
          ),
        ),
        FlatButton(
          child: Text('return'),
          onPressed: start,
        )
      ],
    );
  }
}

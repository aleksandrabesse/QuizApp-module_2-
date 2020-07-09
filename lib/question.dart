import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container( 
        
        child: Text(
          questionText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300, decoration: TextDecoration.underline, decorationThickness: 0.9),
        ),
        width: double.infinity,
        margin: EdgeInsets.all(10),
      );
    throw UnimplementedError();
  }
}

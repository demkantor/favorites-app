import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'All questions answered!';
    if (resultScore <= 8) {
      resultText = 'You are a strange duck!';
    } else if (resultScore <= 12) {
      resultText = 'You are an ok person';
    } else if (resultScore <= 16) {
      resultText = 'You are super cool!';
    } else {
      resultText = 'We are the same person!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.purple,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}

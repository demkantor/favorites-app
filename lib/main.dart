import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

// the above is the same ass
// void main() => runApp(MySuperApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 4},
        {'text': 'Yellow', 'score': 3},
        {'text': 'Black', 'score': 2},
        {'text': 'Brown', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 4},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Elephat', 'score': 2},
        {'text': 'Snake', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pizza', 'score': 5},
        {'text': 'Hamburger', 'score': 4},
        {'text': 'Salad', 'score': 3},
        {'text': 'Icecream', 'score': 2},
        {'text': 'Pasta', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite season?',
      'answers': [
        {'text': 'All of them', 'score': 5},
        {'text': 'Summer', 'score': 4},
        {'text': 'Spring', 'score': 3},
        {'text': 'Fall', 'score': 2},
        {'text': 'Winter', 'score': 1},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('another question...');
    } else {
      print('we done!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favorites App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

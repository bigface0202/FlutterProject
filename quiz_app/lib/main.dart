import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';
// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 0},
        {'text': 'Green', 'score': 20},
        {'text': 'White', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s your favorite car?',
      'answers': [
        {'text': 'GT-R', 'score': 0},
        {'text': 'HUMMER', 'score': 20},
        {'text': 'MARCH', 'score': 50},
        {'text': 'SUPRA', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s your favorite skill?',
      'answers': [
        {'text': 'ENGLISH', 'score': 500},
        {'text': 'Ph.D', 'score': 10000},
        {'text': 'WORKOUT', 'score': 200},
        {'text': 'Python', 'score': 100}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    print(_totalScore);
    if (_questionIndex > _questions.length) {
      _questionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

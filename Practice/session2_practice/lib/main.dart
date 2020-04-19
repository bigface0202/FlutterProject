// Create a new Flutter App (flutter create flutter_assignment, then replace your main.dart with the attached one)
// and output an AppBar and some text below it (i.e. in the body of the page)

// Add a button (e.g. RaisedButton) which changes the text (to any other text of your choice)

// Split the app into three custom widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import './showtext.dart';
import './done.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _text = ['Apple', 'Muscle', 'Whisle', 'Dousuru?'];
  var _textIndex = 0;
  void _changeText() {
    setState(() {
      _textIndex++;
    });
    print(_textIndex);
  }

  void _resetText(){
    setState(() {
      _textIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Session2 Practice'),
        ),
        body: _textIndex < _text.length
            ? ShowText(
                textIndex: _textIndex,
                textList: _text,
                changeText: _changeText,
              )
            : Done(_resetText),
      ),
    );
  }
}

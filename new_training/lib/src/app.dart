import 'package:flutter/material.dart';
import 'screen/new_training_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'New Training',
      home: Scaffold(
        body: NewTrainingScreen(),
      ),
    );
  }
}

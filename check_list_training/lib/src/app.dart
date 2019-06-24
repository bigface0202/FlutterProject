import 'package:flutter/material.dart';
import 'screens/index_screen.dart';
import 'menu/menu.dart';
import 'screens/date_screen.dart';
// import 'screens/date_screen.dart';

List<Menu> trainingMenu = [
  new Menu('Shoulder', false),
  new Menu('Chest', false),
  new Menu('Back', false),
  new Menu('Arm', false),
  new Menu('Leg', false),
  new Menu('Abdominal', false),
  new Menu('Aerobics', false),
];

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Training list'),
        ),
        body: IndexScreen(menu: trainingMenu),
      ),
    );
  }
}

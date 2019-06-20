import 'package:flutter/material.dart';
import 'screens/index_screen.dart';
import 'screens/date_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexScreen(),
      ),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/test') {
      return MaterialPageRoute(
        builder: (context) {
          return DateScreen();
        },
      );
    }
  }
}

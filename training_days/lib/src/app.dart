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
    final itemId = int.parse(settings.name.replaceFirst('/muscle', ''));
    final address = settings.name.substring(0, 7);
    if (address == '/muscle') {
      return MaterialPageRoute(
        builder: (context) {
          return DateScreen(
            itemId: itemId,
          );
        },
      );
    }
  }
}

import 'package:flutter/material.dart';

class Done extends StatelessWidget {
  final Function resetHandler;

  Done(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            'You done!',
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text(
              'Reset',
              style: TextStyle(fontSize: 20),
            ),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}

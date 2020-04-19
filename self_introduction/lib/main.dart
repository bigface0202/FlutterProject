import 'package:flutter/material.dart';
import './face.dart';
import './biography.dart';
import './skill.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Self introduction'),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Face(),
              Biography(),
              Skill(),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('View more'),
                // onPressed: ,
              )
            ],
          ),
        ),
      ),
    );
  }
}

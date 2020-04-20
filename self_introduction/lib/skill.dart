import 'package:flutter/material.dart';

class Skill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(Icons.star, color: Colors.green)),
              Text(
                'Skill',
                style: TextStyle(fontSize: 28),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Python',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'AI, Machine learning',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Workout',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '3 years',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '1 year',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'More than 5 years',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

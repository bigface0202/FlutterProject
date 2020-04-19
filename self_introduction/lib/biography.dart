import 'package:flutter/material.dart';

class Biography extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                child: Icon(Icons.school, color: Colors.grey)),
            Text(
              'Biography',
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
                    '02, Feb., 1993',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '03, Mar., 2013',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '03, Mar., 2020',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
                Column(
                  children: <Widget>[
                    Text(
                      'Born in Fukui, Japan.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Graduated FNCT.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Received Ph.D in Hiroshima Univ.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Face extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset('images/Face.jpg'),
        Flexible(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  'Yusuke Kishishita',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Ph.D of engineering',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  margin:EdgeInsets.all(10),
                  child: Text(
                    'Machine learning and AI engineer in Global Walkers.inc',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

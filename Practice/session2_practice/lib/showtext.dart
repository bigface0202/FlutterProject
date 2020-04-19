import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final int textIndex;
  final List textList;
  final Function changeText;

  ShowText({
    @required this.textIndex,
    @required this.textList,
    @required this.changeText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            textList[textIndex],
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text(
              'Change the text',
              style: TextStyle(fontSize: 20),
            ),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: changeText,
          ),
        ],
      ),
    );
  }
}

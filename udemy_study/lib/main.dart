import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        //ここはヘッダー
        title: Text('Lets see some images!'),
      ),
      floatingActionButton: FloatingActionButton(
        //ボタンが出来上がる
        onPressed: () {
          print('Hi there!');
        },
        child: Icon(Icons.clear), //childはボタンの中身
      ),
    ),
  );

  runApp(app);
}

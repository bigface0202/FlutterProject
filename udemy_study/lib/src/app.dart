import 'package:flutter/material.dart';

class App extends StatefulWidget{
  createState(){
    return AppState();
  }
}

//Statelessは画面が変わらない，データが変わらない
// class App extends StatelessWidget{
class AppState extends State<App>{
  int counter = 0;

  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Text('$counter'),
        appBar: AppBar(
        //ここはヘッダー
        title: Text('Lets see some images!'),
      ),
      floatingActionButton: FloatingActionButton(
        //ボタンが出来上がる
        onPressed: () {
          setState((){
            counter += 1;
          });
        },
        child: Icon(Icons.add), //childはボタンの中身
      ),
    ),
  );
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  createState(){
    return AppState();
  }
}

//Statelessは画面が変わらない，データが変わらない
// class App extends StatelessWidget{
class AppState extends State<App>{
  int counter = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 1;
    //varは何回でも中身を変えられる
    //finalは中身を変えられない
    final response = 
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    
    setState((){
      images.add(imageModel);
    });
  }

  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
        //childはボタンの中身
          child: Icon(Icons.add),
        //ボタンが出来上がる
          onPressed: fetchImage,
        ),
        appBar: AppBar(
        //ここはヘッダー
          title: Text('Lets see some images!'),
        ),
      ),
    );
  }
}
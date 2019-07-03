import 'package:flutter/material.dart';
import '../menu/menu.dart';

class DateScreen extends StatefulWidget {
  DateScreen(this.menu);
  List<Menu> menu;
  _DateScreenState createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  List<String> test = [];
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good workout!!'),
      ),
      body: Column(
        children: <Widget>[
        new Expanded(
          child: showDoneOfTraining()
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget showDoneOfTraining() {
    for (Menu p in widget.menu) {
      if (p.isCheck) test.add(p.name.toString());
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              child: Text(
                test[index],
                style: TextStyle(fontSize: 22.0),
              ),
              padding: EdgeInsets.all(10.0),
            ),
          );  
      },
      itemCount: test.length,
    ); 
  }

  Widget submitButton(){
    return RaisedButton(
      onPressed: (){},
      padding: EdgeInsets.only(right:100.0, left:100),
      child: Text('Submit!'),
    );
  }
}

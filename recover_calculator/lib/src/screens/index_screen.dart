import 'package:flutter/material.dart';

final _muscleNames = <String>[
  'Shoulder',
  'Chest',
  'Back',
  'Arm',
  'Leg',
];



class IndexScreen extends StatefulWidget{
  IndexScreenState createState(){
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  DateTime nowDate = DateTime.now();
  var hour = 0;

  void _setTime(){
    setState((){
      hour = nowDate.hour;
    });
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recover calculator'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            shoulderCard(),
            chestCard(),
            backCard(),
            armCard(),
            legCard(),
          ],
        ),
    );
  }

  Widget shoulderCard(){
        return InkWell(
          onTap: () {
            _setTime();
          },
          child: Row(
            children:<Widget>[
              Card(
                child: Padding(
                  child: Text(
                    'Shoulder',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
              ),
              Text('${nowDate.hour - hour}h',
              style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
        );
  }

  Widget chestCard(){
        return InkWell(
          onTap: () {},
          child: Row(
            children:<Widget>[
              Card(
                child: Padding(
                  child: Text(
                    'Chest',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
              ),
              Text('0h',
              style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
        );
    }

    Widget backCard(){
        return InkWell(
          onTap: () {},
          child: Row(
            children:<Widget>[
              Card(
                child: Padding(
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
              ),
              Text('0h',
              style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
        );
    }

    Widget armCard(){
        return InkWell(
          onTap: () {},
          child: Row(
            children:<Widget>[
              Card(
                child: Padding(
                  child: Text(
                    'Arm',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
              ),
              Text('0h',
              style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
        );
    }

    Widget legCard(){
        return InkWell(
          onTap: () {},
          child: Row(
            children:<Widget>[
              Card(
                child: Padding(
                  child: Text(
                    'Leg',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
              ),
              Text('0h',
              style: TextStyle(fontSize: 22.0),
              ),
            ],
          ),
        );
    }
  
  // Widget timeList(){
  //   // return Text("${nowDate.hour - 4} h");
  //   return Text("${_durationTime['Chest']} h",
  //   style: TextStyle(fontSize: 22.0),);
    
  // }

}
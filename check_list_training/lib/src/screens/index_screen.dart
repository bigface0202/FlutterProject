import 'package:flutter/material.dart';
import '../widget/training_menu.dart';
import '../menu/menu.dart';
import '../screens/date_screen.dart';

class IndexScreen extends StatefulWidget {
  IndexScreen({Key key, this.menu}) : super(key: key);
  List<Menu> menu;
  @override
  _IndexScreenState createState() {
    return new _IndexScreenState();
  }
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Expanded(
              child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: widget.menu.map((Menu menu) {
              return new TrainingItemList(menu);
            }).toList(),
          )),
          new RaisedButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/muscle');
              Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  settings: const RouteSettings(name: "/muscle"),
                  builder: (BuildContext context) => DateScreen(widget.menu),
                ),
              );
              for (Menu p in widget.menu) {
                if (p.isCheck) print(p.name);
              }
            },
            child: new Text('Save'),
          )
        ],
      ),
    );
  }
}

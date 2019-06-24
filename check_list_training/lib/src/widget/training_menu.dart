import 'package:flutter/material.dart';
import '../menu/menu.dart';

class TrainingItemList extends StatefulWidget {
  final Menu menu;
  TrainingItemList(Menu menu)
      : menu = menu,
        super(key: new ObjectKey(menu));
  @override
  TrainingItemState createState() {
    return new TrainingItemState(menu);
  }
}

class TrainingItemState extends State<TrainingItemList> {
  final Menu menu;
  TrainingItemState(this.menu);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap: null,
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(menu.name)),
            new Checkbox(
                value: menu.isCheck,
                onChanged: (bool value) {
                  setState(() {
                    menu.isCheck = value;
                  });
                })
          ],
        ));
  }
}

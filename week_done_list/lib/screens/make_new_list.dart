import 'package:flutter/material.dart';

import '.././widgets/main_drawer.dart';

class MakeNewList extends StatefulWidget {
  static const routeName = '/make-new-list';
  final Function addList;
  final Function addMap;

  MakeNewList(this.addList, this.addMap);

  @override
  _MakeNewListState createState() => _MakeNewListState();
}

class _MakeNewListState extends State<MakeNewList> {
  final _newListController = TextEditingController();
  final _newItemController = TextEditingController();

  void _submitNewList() {
    final enteredTitle = _newListController.text;

    widget.addList(enteredTitle);

    Navigator.of(context).pushReplacementNamed('/');
  }

  void _submitNewMap() {
    List<String> array = [];

    final enteredTitle = _newListController.text;
    array.add(_newItemController.text);

    widget.addMap(enteredTitle, array);

    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make new list'),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'New key'),
              keyboardType: TextInputType.number,
              controller: _newListController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'New item'),
              keyboardType: TextInputType.number,
              controller: _newItemController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text(
                  'Submit!',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: _submitNewMap,
              ),
            )
          ],
        ),
      ),
    );
  }
}

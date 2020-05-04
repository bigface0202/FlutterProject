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
  final _itemNumController = TextEditingController();
  final List<TextEditingController> _newItemListcontroller = [];

  int _itemNum = 0;

  void _submitNewMap() {
    List<String> array = [];

    final enteredTitle = _newListController.text;
    for (int i = 0; i < _newItemListcontroller.length; i++) {
      array.add(_newItemListcontroller[i].text);
    }
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,//Get Keyboard height + 10
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // Rowの中にTextFieldを作る場合は，横の幅を指定する必要がある
                  // TextField自体が横幅を指定する変数を持っていない
                  // When you make TextField in Row, you should declear the width space of TextField
                  // TextField doesn't have width space.
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'New key name'),
                      keyboardType: TextInputType.text,
                      controller: _newListController,
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'How many item?'),
                      keyboardType: TextInputType.number,
                      controller: _itemNumController,
                      onChanged: (_) {
                        setState(() {
                          _itemNum = int.parse(_itemNumController.text);
                          for (int i = 0; i < _itemNum; i++)
                            _newItemListcontroller.add(TextEditingController());
                        });
                      },
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < _itemNum; i++)
                TextField(
                  decoration: InputDecoration(labelText: 'Item $i'),
                  keyboardType: TextInputType.text,
                  controller: _newItemListcontroller[i],
                ),
              _newItemListcontroller.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            child: Text(
                              'Submit!',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: _submitNewMap,
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

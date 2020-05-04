import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  final List<String> muscleList;
  final Map<String, List<String>> itemMap;

  NewTransaction(this.addTx, this.muscleList, this.itemMap);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // final _titleController = TextEditingController();
  final _spentTimeController = TextEditingController();
  DateTime _selectedDate;
  String _selectedMuscle = null;
  String _selectedKey = null;
  String _selectedItem = null;

  void _submitData() {
    if (_spentTimeController.text.isEmpty) {
      return;
    }
    final enteredItem = _selectedItem;
    final enteredTitle = _selectedKey;
    final enteredSpentTime = double.parse(_spentTimeController.text);

    if (enteredTitle.isEmpty || enteredSpentTime < 0 || _selectedDate == null) {
      return;
    }

    // StatefulWidgetでコンストラクタで定義した引数にはwidgetをつける
    widget.addTx(
      enteredTitle,
      enteredItem,
      enteredSpentTime,
      _selectedDate,
    );
    // 戻る遷移（pushで進む）
    // この場合だと元の画面に戻る
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(testMap.keys);
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('What did you do?'),
              DropdownButton<String>(
                value: _selectedKey,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                elevation: 16,
                style: TextStyle(fontSize: 20, color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    _selectedKey = newValue;
                  });
                },
                items: widget.itemMap.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          _selectedKey != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Which one?'),
                    DropdownButton<String>(
                      value: _selectedItem,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      elevation: 16,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                      items: widget.itemMap[_selectedKey]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                )
              : SizedBox(
                  height: 50,
                ),
          TextField(
            decoration: InputDecoration(labelText: 'Spent time'),
            keyboardType: TextInputType.number,
            controller: _spentTimeController,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: _selectedDate == null
                ? Text(
                    'No date chosen',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    'Chosen date:${DateFormat.yMd().format(_selectedDate)}',
                    style: TextStyle(fontSize: 20),
                  ),
          ),
          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text('Choose date'),
            onPressed: _presentDatePicker,
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Submit!'),
            onPressed: _submitData,
          ),
          IconButton(
            icon: Icon(Icons.subdirectory_arrow_left),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}

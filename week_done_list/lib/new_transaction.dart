import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // final _titleController = TextEditingController();
  final _spentTimeController = TextEditingController();
  DateTime _selectedDate;
  String _selectedMuscle = 'Chest';
  List<String> _muslceList = [
    'Chest',
    'Shoulder',
    'Biceps',
    'Triceps',
    'Back',
    'Abdominal'
  ];

  void _submitData() {
    if (_spentTimeController.text.isEmpty) {
      return;
    }
    final enteredTitle = _selectedMuscle;
    final enteredSpentTime = double.parse(_spentTimeController.text);

    if (enteredTitle.isEmpty || enteredSpentTime < 0 || _selectedDate == null) {
      return;
    }

    // StatefulWidgetだと引数はStatefulWidgetの方で定義するからwidget.をつける（？）
    widget.addTx(
      enteredTitle,
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
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Muscle',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              DropdownButton<String>(
                value: _selectedMuscle,
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
                    _selectedMuscle = newValue;
                  });
                },
                items:
                    _muslceList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Spent time'),
            keyboardType: TextInputType.number,
            controller: _spentTimeController,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              _selectedDate == null
                  ? 'No date chosen'
                  : 'Chosen date:${DateFormat.yMd().format(_selectedDate)}',
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

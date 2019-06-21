import 'package:flutter/material.dart';
import 'dart:async';

final _categoryNames = <String>[
  'Shoulder',
  'Chest',
  'Back',
  'Upper arm',
  'Lower arm',
  'Upper leg',
  'Lower leg',
  'Abdominal',
  'Aerobics',
];

class DateScreen extends StatefulWidget {
  DateScreen({Key key, this.itemId}) : super(key: key);
  final int itemId;

  @override
  _DateScreenState createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(
        () {
          selectedDate = picked;
        },
      );
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryNames[widget.itemId]),
      ),
      body: chooseDateTime(context),
    );
  }

  Widget chooseDateTime(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("${selectedDate.toLocal()}"),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select date'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './screens/index_page.dart';
import './screens/make_new_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Shoulder',
    //   spentTime: 1,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Chest',
    //   spentTime: 2,
    //   date: DateTime.now(),
    // ),
  ];

  final Map<String, List<String>> _itemMap = {
    'Sports': ['Soccer', 'Baseball', 'Workout'],
    'Study': ['Math', 'English', 'Science'],
  };

  List<String> _muscleList = [];

  void _addNewList(String listTitle) {
    setState(() {
      _muscleList.add(listTitle);
    });
  }

  void _addNewMap(String keyName, List<String> itemList){
    setState(() {
      _itemMap[keyName] = itemList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => IndexPage(_userTransactions, _muscleList, _itemMap),
        MakeNewList.routeName: (ctx) => MakeNewList(_addNewList, _addNewMap),
      },
    );
  }
}

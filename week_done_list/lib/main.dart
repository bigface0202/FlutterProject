import 'package:flutter/material.dart';

import './models/transaction.dart';
import './transactions_list.dart';
import './new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Shoulder',
      spentTime: 1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Chest',
      spentTime: 2,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransactions(
      String txTitle, double txSpentTime, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      spentTime: txSpentTime,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransactions),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Training list')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TransactionsList(_userTransactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}

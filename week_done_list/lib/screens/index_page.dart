import 'package:flutter/material.dart';

import '.././widgets/main_drawer.dart';
import '.././models/transaction.dart';
import '.././transactions_list.dart';
import '.././new_transaction.dart';

class IndexPage extends StatefulWidget {
  final List<Transaction> userTransactions;
  final List<String> muscleList;
  final Map<String, List<String>> itemMap;
  IndexPage(this.userTransactions, this.muscleList, this.itemMap);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  void _addNewTransactions(
      String txTitle, String txSubTitle, double txSpentTime, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      subTitle: txSubTitle,
      spentTime: txSpentTime,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      widget.userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransactions, widget.muscleList, widget.itemMap),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Training list')),
      drawer: MainDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TransactionsList(widget.userTransactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}

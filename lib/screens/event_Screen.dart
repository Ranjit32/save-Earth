import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:save_Earth/widget/new_transaction.dart';
import 'package:save_Earth/widget/transaction.dart';
import 'package:save_Earth/widget/transaction_list.dart';


class EventScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EventScreen> {
  List<Transaction> _transactions = [];
  bool _showChart = false;
  

  void _addNewTransaction(
      String transactionTitle, String transactionAmount, DateTime chosenDate) {
    //creating a new Transaction
    final newTransaction = Transaction(
      title: transactionTitle,
      about: transactionAmount,
      id: DateTime.now().toString(),
      date: chosenDate,
    );

    setState(() {
      //rebuilding the state of the TransactionList
      _transactions.add(newTransaction);
    });
  }
  //buttomModalSheet

  void _startAddingNewTransaction() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            //passing _addnewTransaction function to new_transaction.dart
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) {
        return transaction.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text("Events"),
      actions: <Widget>[
        IconButton(
          icon: Icon(CupertinoIcons.add),
          onPressed: _startAddingNewTransaction,
        )
      ],
    );

    final transactionListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.75,
      child: TransactionList(
        _transactions,
        _deleteTransaction,
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Text("Show Chart"),
                  // CupertinoSwitch(
                  //   value: _showChart,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       _showChart = val;
                  //     });
                  //   },
                  // ),
                ],
              ),
            // if (!isLandscape)
            //   Container(
            //     height: (mediaQuery.size.height -
            //             appBar.preferredSize.height -
            //             mediaQuery.padding.top) *
            //         0.25,
            //     child: Chart(
            //       _recentTransactions,
            //     ),
            //   ),
            if (!isLandscape) transactionListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.6,
                      // child: Chart(
                      //   _recentTransactions,
                      // ),
                    )
                  : transactionListWidget
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(
                CupertinoIcons.add,
              ),
              onPressed: _startAddingNewTransaction,
            ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:save_Earth/widget/transaction.dart';

class TransactionList extends StatefulWidget {
  //importing the list of _transaction with generic type transaction from homePage.dart
  final List<Transaction> _userTransaction;
  final Function _removeTransaction;

  TransactionList(
    this._userTransaction,
    this._removeTransaction,
  );

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
   var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget._userTransaction.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.event_available,
                      size: constraints.maxHeight * 0.6,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "No Events added yet.....",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: widget._userTransaction.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 3.0,
                  child: ListTile(
                      leading: Text(
                        widget._userTransaction[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      // leading: CircleAvatar(
                      //   radius: 30.0,
                      //   child: FittedBox(
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text(
                      //           "widget._userTransaction[index].about"),
                      //     ),
                      //   ),
                      // ),
                      title: Text(
                        widget._userTransaction[index].about,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(
                          widget._userTransaction[index].date,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: MediaQuery.of(context).size.width > 350
                          ? FlatButton.icon(
                              icon: Icon(
                                CupertinoIcons.delete,
                                color: Colors.red,
                              ),
                              label: Text("Delete"),
                              textColor: Colors.red,
                              onPressed: () => widget._removeTransaction(
                                widget._userTransaction[index].id,
                              ),
                            )
                          : IconButton(
                              icon: Icon(
                                CupertinoIcons.delete,
                                color: Colors.white
                              ),
                              color: Theme.of(context).primaryColor,
                              onPressed: () => widget._removeTransaction(
                                widget._userTransaction[index].id,
                              ),
                            )),
                );
              },
            ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  //getting the _addnewTransaction funnction from homepage.dart
  final Function _transactionAdder;
  NewTransaction(this._transactionAdder);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = new TextEditingController();
  final _amountController = new TextEditingController();
  DateTime _pickedDate;

  void _submitTransaction() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAbout = _amountController.text;

    if (enteredTitle.isEmpty || enteredAbout.isEmpty || _pickedDate == null) {
      return;
    }
    widget._transactionAdder(
      enteredTitle,
      enteredAbout,
      _pickedDate,
    );
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2050),
    ).then(
      (_selectedDate) {
        if (_selectedDate == null) {
          return;
        }
        setState(() {
          _pickedDate = _selectedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom:  MediaQuery.of(context).viewInsets.bottom +10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Name of the event"),
                controller: _titleController,
                onSubmitted: (_) => _submitTransaction(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Description of the Event"),
                controller: _amountController,
                onSubmitted: (_) => _submitTransaction(),
                
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _pickedDate == null
                          ? "No Date Chosen!"
                          : "Picked Date:"
                              "${DateFormat.yMd().format(_pickedDate)}",
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "Choose a Date",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "QuickSand"),
                    ),
                    onPressed: _datePicker,
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              CupertinoButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Add Event",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _submitTransaction),
            ],
          ),
        ),
      ),
    );
  }
}

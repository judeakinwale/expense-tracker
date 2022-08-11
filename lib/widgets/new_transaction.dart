// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // NewTransaction({Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitTxData() {
    // if (amountController.text.isEmpty) {
    //   return;
    // }
    if (amountController.text.isEmpty) return;
    final txTitle = titleController.text;
    final txAmount = double.parse(amountController.text);

    if (txTitle.isEmpty || txAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(txTitle, txAmount, _selectedDate);

    // close bottom level sheet (close the modal when completed)
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 4,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged:(value) => amountInput = value,
              controller: titleController,
              onSubmitted: (_) => _submitTxData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged:(value) => amountInput = value,
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitTxData(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Chosen Date'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate as DateTime)}')),
                  FlatButton(
                    onPressed: _presentDatePicker,
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitTxData,
              // onPressed: () {
              //   print(titleController.text);
              //   print(amountController.text);
              // },
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button!.color,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button!.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

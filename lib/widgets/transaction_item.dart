// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;
  @override
  void initState() {
    super.initState();
    const availableColors = [Colors.blue, Colors.red, Colors.black, Colors.purple];
    _bgColor = availableColors[Random().nextInt(4)];
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                  '\$${widget.transaction.amount.toStringAsFixed(1)}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () {
                  widget.deleteTransaction(widget.transaction.id);
                },
                textColor: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              )
            : IconButton(
                onPressed: () {
                  widget.deleteTransaction(widget.transaction.id);
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
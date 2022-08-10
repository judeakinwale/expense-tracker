import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  // UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'Weekly Groceries',
        amount: 420.69,
        date: DateTime.now()),
  ];

  List<Transaction> recentTransactions = [];
  
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(title: title, amount: amount, date: DateTime.now(), id: DateTime.now().toString(),);

    setState(() {
      _userTransactions.add(newTx);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions),
    ],);
  }
}
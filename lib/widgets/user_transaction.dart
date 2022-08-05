import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';

class UserTransaction extends StatefulWidget {
  // UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(),
      TransactionList(),
    ],);
  }
}
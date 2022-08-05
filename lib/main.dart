import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
// import 'models/transaction.dart';

void main() {
  // runApp(const MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10,),
              child: Card(
                color: Colors.blue,
                child: Text('Chart!'),
              ),
            ),
            NewTransaction(),
            TransactionList(),
          ],
        ));
  }
}

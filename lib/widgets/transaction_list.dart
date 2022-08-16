// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions Added Yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: _deleteTransaction,
                    ))
                .toList(),
          );
    // : ListView.builder(
    //     itemCount: transactions.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return TransactionItem(
    //         key: ValueKey(transactions[index].id),
    //         // key: UniqueKey(),
    //         transaction: transactions[index],
    //         deleteTransaction: _deleteTransaction,
    //       );
    //       // return Card(
    //       //   child: Row(children: <Widget>[
    //       //     Container(
    //       //       margin: EdgeInsets.symmetric(
    //       //         vertical: 10,
    //       //         horizontal: 15,
    //       //       ),
    //       //       decoration: BoxDecoration(
    //       //         border: Border.all(
    //       //           color: Theme.of(context).primaryColorDark,
    //       //           width: 2,
    //       //         ),
    //       //       ),
    //       //       padding: EdgeInsets.all(10),
    //       //       child: Text(
    //       //         '\$ ${transactions[index].amount.toStringAsFixed(2)}',
    //       //         style: TextStyle(
    //       //           fontWeight: FontWeight.bold,
    //       //           fontSize: 20,
    //       //           color: Theme.of(context).primaryColor,
    //       //         ),
    //       //       ),
    //       //     ),
    //       //     Column(
    //       //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //       crossAxisAlignment: CrossAxisAlignment.start,
    //       //       children: <Widget>[
    //       //         Text(transactions[index].title,
    //       //             style: Theme.of(context).textTheme.headline6
    //       //             // style: TextStyle(
    //       //             //   fontWeight: FontWeight.bold,
    //       //             //   fontSize: 16,
    //       //             // ),
    //       //             ),
    //       //         Text(
    //       //           // '${e.date}',
    //       //           DateFormat.yMMMEd().format(transactions[index].date),
    //       //           style: TextStyle(
    //       //             color: Colors.grey,
    //       //           ),
    //       //         ),
    //       //       ],
    //       //     ),
    //       //   ]),
    //       // );
    //     },
    //   );

    // return Container(
    //   height: 300,
    //   child: ListView(
    //     children: transactions.map((e) {
    //       return Card(
    //         child: Row(children: <Widget>[
    //           Container(
    //             margin: EdgeInsets.symmetric(
    //               vertical: 10,
    //               horizontal: 15,
    //             ),
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //               color: Colors.purple,
    //               width: 2,
    //             )),
    //             padding: EdgeInsets.all(10),
    //             child: Text(
    //               '\$ ${e.amount.toStringAsFixed(2)}',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 20,
    //                 color: Colors.purple,
    //               ),
    //             ),
    //           ),
    //           Column(
    //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Text(
    //                 e.title,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //               Text(
    //                 // '${e.date}',
    //                 DateFormat.yMMMEd().format(e.date),
    //                 style: TextStyle(
    //                   color: Colors.grey,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ]),
    //       );
    //     }).toList(),
    //   ),
    // );
  }
}

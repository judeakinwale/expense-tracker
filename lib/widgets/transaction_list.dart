// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions Added Yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () {_deleteTransaction(transactions[index].id);},
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
                // return Card(
                //   child: Row(children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.symmetric(
                //         vertical: 10,
                //         horizontal: 15,
                //       ),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Theme.of(context).primaryColorDark,
                //           width: 2,
                //         ),
                //       ),
                //       padding: EdgeInsets.all(10),
                //       child: Text(
                //         '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //           color: Theme.of(context).primaryColor,
                //         ),
                //       ),
                //     ),
                //     Column(
                //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6
                //             // style: TextStyle(
                //             //   fontWeight: FontWeight.bold,
                //             //   fontSize: 16,
                //             // ),
                //             ),
                //         Text(
                //           // '${e.date}',
                //           DateFormat.yMMMEd().format(transactions[index].date),
                //           style: TextStyle(
                //             color: Colors.grey,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ]),
                // );
              },
            ),
    );

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

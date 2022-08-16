// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  // // may be required to enable orientation limiting on some devices
  // WidgetsFlutterBinding.ensureInitialized();
  // // limit device orientation to portrait only
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  // runApp(const MyApp()); // app is not const
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber), // accent color
        // accentColor: Colors.amber,  // for older flutter versions
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          // // Doesn't work on newer flutter versions
          // textTheme: ThemeData.light().textTheme.copyWith(
          //   headline6: TextStyle(
          //     fontFamily: 'OpenSans',
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: '1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: '2',
    //     title: 'Weekly Groceries',
    //     amount: 420.69,
    //     date: DateTime.now()),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      return _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  /// Open the modal for creating transactions
  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return NewTransaction(_addNewTransaction);
        // Fixes bug where tapping on the modal closes it (not needed in newer flutter versions)
        // return GestureDetector(
        //   onTap: (() {}),
        //   child: NewTransaction(_addNewTransaction),
        //   behavior: HitTestBehavior.opaque,
        // );
      },
    );
  }

  // Widget _buildLandscapeContent(MediaQueryData mediaQuery, AppBar appBar) {
  List<Widget> _buildLandscapeContent(MediaQueryData mediaQuery,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Show Chart',
              style: Theme.of(context).textTheme.headline6,
            ),
            Switch.adaptive(
              activeColor: Theme.of(context).accentColor,
              value: _showChart,
              onChanged: (value) {
                setState(() {
                  _showChart = value;
                });
              },
            )
          ],
        ),
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(
                _recentTransactions,
              ),
            )
          : txListWidget
    ];
  }

  // Widget _buildPortraitContent(MediaQueryData mediaQuery, AppBar appBar) {
  List<Widget> _buildPortraitContent(MediaQueryData mediaQuery,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Chart(
          _recentTransactions,
        ),
      ),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final curScaleFactor = mediaQuery.textScaleFactor;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar;
    Platform.isIOS
        ? appBar = CupertinoNavigationBar(
            middle: Text('Expense Tracker'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _startAddNewTransaction(context),
                  child: Icon(CupertinoIcons.add),
                ),
              ],
            ))
        : appBar = AppBar(
            title: Text(
              'Expense Tracker',
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );

    // final PreferredSizeWidget appBar = Platform.isIOS
    //     ? PreferredSizeWidget CupertinoNavigationBar(
    //         middle: Text('Expense Tracker'),
    //         trailing: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             GestureDetector(
    //               onTap: () => _startAddNewTransaction(context),
    //               child: Icon(CupertinoIcons.add),
    //             ),
    //           ],
    //         ))
    //     : PreferredSizeWidget AppBar(
    //         title: Text(
    //           'Expense Tracker',
    //         ),
    //         actions: [
    //           IconButton(
    //             icon: Icon(Icons.add),
    //             onPressed: () => _startAddNewTransaction(context),
    //           ),
    //         ],
    //       );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
        _userTransactions,
        _deleteTransaction,
      ),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (isLandscape)
              ..._buildLandscapeContent(mediaQuery, appBar, txListWidget),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar:
                appBar as ObstructingPreferredSizeWidget, // might break
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddNewTransaction(context),
                    child: Icon(Icons.add),
                  ),
          );
  }
}

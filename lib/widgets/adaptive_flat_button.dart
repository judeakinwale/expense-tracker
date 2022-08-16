// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;
  const AdaptiveFlatButton(this.text, this.handler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Theme.of(context).primaryColor,
              ),
            ),
          )
        : FlatButton(
            onPressed: handler,
            textColor: Theme.of(context).primaryColor,
            child: Text(
              'Choose Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Theme.of(context).primaryColor,
              ),
            ),
          );
  }
}

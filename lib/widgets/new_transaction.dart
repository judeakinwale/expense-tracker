import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // NewTransaction({Key? key}) : super(key: key);
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTxData() {
    final txTitle = titleController.text;
    final txAmount = double.parse(amountController.text);

    if (txTitle.isEmpty || txAmount <= 0) {
      return;
    }

    widget.addTx(txTitle, txAmount);

    // close bottom level sheet (close the modal when completed)
    Navigator.of(context).pop();
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
              onSubmitted:(_) => submitTxData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged:(value) => amountInput = value,
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted:(_) => submitTxData(),
            ),
            FlatButton(
              onPressed: submitTxData,
              // onPressed: () {
              //   print(titleController.text);
              //   print(amountController.text);
              // },
              child: Text('Add Transaction', style: TextStyle(color: Colors.purple),),
            )
          ],
        ),
      ),
    );
  }
}
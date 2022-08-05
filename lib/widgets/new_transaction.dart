import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // NewTransaction({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              // onChanged:(value) => titleInput = value,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged:(value) => amountInput = value,
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
              child: Text('Add Transaction', style: TextStyle(color: Colors.purple),),
            )
          ],
        ),
      ),
    );
  }
}
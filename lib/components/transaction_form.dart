
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm(this.addTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Value (R\$)'),
              controller: valueController,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: Text('New Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.1),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                  child: Text(
                    "No transactions found!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
                SizedBox(
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return TransactionItem(transaction: transaction, onRemove: onRemove);
            },
          );
  }
}

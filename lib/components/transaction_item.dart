import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.onRemove,
  });

  final Transaction transaction;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.tertiary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$ ${transaction.value}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(transaction.date),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: MediaQuery.of(context).size.width > 350
            ? TextButton.icon(
          onPressed: () => onRemove(transaction.id),
          icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
          label: Text(
            "Delete",
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => onRemove(transaction.id),
        ),
      ),
    );
  }
}
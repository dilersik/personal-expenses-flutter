import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.onRemove,
  });

  final Transaction transaction;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [Colors.red, Colors.green, Colors.blue, Colors.purple];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = colors[Random().nextInt(colors.length)];
  }

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
          backgroundColor: _backgroundColor,
          foregroundColor: Theme.of(context).colorScheme.tertiary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$ ${widget.transaction.value}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.transaction.date),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: MediaQuery.of(context).size.width > 350
            ? TextButton.icon(
          onPressed: () => widget.onRemove(widget.transaction.id),
          icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
          label: Text(
            "Delete",
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => widget.onRemove(widget.transaction.id),
        ),
      ),
    );
  }
}
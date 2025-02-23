import 'package:flutter/material.dart';
import 'package:personal_expenses/components/transaction_form.dart';
import 'package:personal_expenses/components/transaction_list.dart';

import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      value: 300.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      value: 20.53,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New PPKs',
      value: 3000.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions, onRemove),
        TransactionForm(addTransaction),
      ],
    );
  }

  void onRemove(String p1) {}

  void addTransaction() {}
}

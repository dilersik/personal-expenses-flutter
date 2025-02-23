import 'package:flutter/material.dart';
import 'package:personal_expenses/components/transaction_form.dart';
import 'package:personal_expenses/components/transaction_list.dart';
import 'package:personal_expenses/components/transaction_user.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Personal Expenses',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text("Chart"),
              ),
            ),
            TransactionUser(),
          ],
        ));
  }
}

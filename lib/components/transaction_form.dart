import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/components/adaptive_button.dart';
import 'package:personal_expenses/components/adaptive_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isNotEmpty && value > 0) {
      widget.onSubmit(title, value, _selectedDate);
    }
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;

      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptiveTextField(
                label: 'Title',
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptiveTextField(
                label: 'Value (R\$)',
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              Padding(padding: EdgeInsets.all(6)),
              Row(
                children: [
                  Expanded(
                    child: Text("Date: ${DateFormat('dd/MM/y').format(_selectedDate)}"),
                  ),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      'Select Date',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(6)),
              AdaptiveButton(label: "New Transaction", onPressed: _submitForm)
            ],
          ),
        ),
      ),
    );
  }
}

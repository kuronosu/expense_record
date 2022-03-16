import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/ui/widgets/datetime_picker.dart';
import 'package:expense_record/Expenses/ui/widgets/utils.dart';
import 'package:expense_record/utils/strings_utils.dart';

const url = 'https://c.tenor.com/IMNDZBkct8gAAAAC/anime-girl.gif';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({Key? key}) : super(key: key);

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  late ExpensesBloc _bloc;

  final _formKey = GlobalKey<FormState>();
  var withTime = true;

  void _addExpense() {
    _bloc.addExpense(
        Expense(description: description.capitalize(), date: date, price: value));
    Navigator.pop(context);
  }

  String description = "";
  DateTime date = DateTime.now();
  double value = 0;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          descriptionField,
          valueField,
          DatetimePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime(3000),
            onChanged: (dt) => date = dt,
            label: 'Date',
          ),
          Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _addExpense();
                  }
                },
              )),
        ],
      ),
    );
  }

  TextFormField get descriptionField => TextFormField(
        style: const TextStyle(color: Colors.white),
        onSaved: (String? value) => description = value ?? "",
        validator: (value) {
          if (value == null || value.isEmpty || value.trim().isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
            icon: whiteIcon(Icons.description_rounded),
            border: inputBorder(Colors.white54),
            enabledBorder: inputBorder(Colors.white54),
            disabledBorder: inputBorder(Colors.white12),
            focusedBorder: inputBorder(Colors.white),
            errorBorder: inputBorder(Colors.red),
            labelText: 'Description',
            labelStyle: const TextStyle(color: Colors.white)),
      );

  TextFormField get valueField => TextFormField(
        style: const TextStyle(color: Colors.white),
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
          TextInputFormatter.withFunction((oldValue, newValue) {
            try {
              final text = newValue.text;
              if (text.isNotEmpty) double.parse(text);
              return newValue;
            } catch (e) {
              return oldValue;
            }
          }),
        ],
        onSaved: (String? value) =>
            this.value = value != null ? double.parse(value) : 0,
        validator: (value) {
          if (value == null || value.isEmpty || value.trim().isEmpty) {
            return 'Please enter a valid value';
          }
          return null;
        },
        decoration: InputDecoration(
            icon: whiteIcon(Icons.monetization_on_rounded),
            border: inputBorder(Colors.white54),
            enabledBorder: inputBorder(Colors.white54),
            disabledBorder: inputBorder(Colors.white12),
            focusedBorder: inputBorder(Colors.white),
            errorBorder: inputBorder(Colors.red),
            labelText: 'Value',
            labelStyle: const TextStyle(color: Colors.white)),
      );
}

import 'dart:math';

import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

const url = 'https://c.tenor.com/IMNDZBkct8gAAAAC/anime-girl.gif';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

final _random = Random();
int next(int min, int max) => min + _random.nextInt(max - min);

class _AddExpenseState extends State<AddExpense> {
  late ExpensesBloc _bloc;

  void _addExpense() {
    _bloc.addExpense(Expense(
        description: 'Pc',
        date: DateTime.now(),
        img: url,
        price: next(10, 100).toDouble()));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of(context);
    return Background(
        child: SafeArea(
            child: Center(
      child: FloatingActionButton.extended(
          onPressed: _addExpense,
          label: const Text(
            'Add',
            style: TextStyle(color: Colors.white),
          )),
    )));
  }
}

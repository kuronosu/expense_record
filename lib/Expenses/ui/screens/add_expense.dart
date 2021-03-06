import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/widgets/background.dart';
import 'package:expense_record/Expenses/ui/widgets/expense_from.dart';

// ignore: must_be_immutable
class AddExpense extends StatelessWidget {
  AddExpense({Key? key}) : super(key: key);
  static const routeName = '/add_expense';
  late ExpensesBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of(context);
    return Material(
      child: Background(
        child: SafeArea(
            child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('New expense'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ExpenseForm(
                  buttonText: 'Add',
                  onSubmit: (description, date, value) {
                    _bloc.addExpense(Expense(
                        description: description,
                        date: date,
                        price: value));
                    Navigator.pop(context);
                  }),
            ),
          ],
        )),
      ),
    );
  }
}

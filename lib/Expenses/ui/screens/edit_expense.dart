import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/ui/widgets/expense_from.dart';
import 'package:expense_record/widgets/background.dart';

// ignore: must_be_immutable
class EditExpense extends StatelessWidget {
  EditExpense({Key? key}) : super(key: key);
  static const routeName = '/edit_expense';
  late ExpensesBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of(context);
    final expense = ModalRoute.of(context)!.settings.arguments as Expense;
    return Material(
      child: Background(
        child: SafeArea(
            child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Edit expense'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ExpenseForm(
                buttonText: 'Edit',
                initialData: expense,
                onSubmit: (description, date, value) {
                  _bloc.updateExpense(Expense(
                    id: expense.id,
                    img: expense.img,
                    description: description,
                    price: value,
                    date: date,
                  ));
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}

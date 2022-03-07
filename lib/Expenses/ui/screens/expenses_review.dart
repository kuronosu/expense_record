import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/ui/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ExpensesReview extends StatefulWidget {
  const ExpensesReview({Key? key}) : super(key: key);

  @override
  State<ExpensesReview> createState() => EexpensesReviewState();
}

const url = 'https://c.tenor.com/IMNDZBkct8gAAAAC/anime-girl.gif';

class EexpensesReviewState extends State<ExpensesReview> {
  late ExpensesBloc _bloc;

  void _addExpense() {
    _bloc.addExpense(
        Expense(description: 'Pc', date: DateTime.now(), img: url, price: 10));
  }

  @override
  dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: _bloc.streamExpenses,
        initialData: const [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return Stack(children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: ExpensesList(expenses: snapshot.data!.cast<Expense>()),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton.extended(
                onPressed: _addExpense,
                tooltip: 'Increment',
                icon: const Icon(Icons.add),
                label: const Text('New expense'),
              ),
            ),
          ]);
        });
  }
}

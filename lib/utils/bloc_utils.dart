import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/ui/screens/expenses_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

final expensesBloc = ExpensesBloc();

class Blocs {

}

Widget withExpenseBloc(Widget widget) {
  return withBloc(expensesBloc, widget);
}

Widget withBloc<T extends Bloc>(T bloc, Widget widget) {
  return BlocProvider(bloc: bloc, child: const ExpensesReview());
}
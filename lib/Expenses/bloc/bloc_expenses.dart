import 'dart:async';

import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/repository/expenses_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ExpensesBloc implements Bloc {
  ExpensesRepository repository = ExpensesRepository();

  final _expensesStreamController = StreamController<List<Expense>>();
  StreamSink<List<Expense>> get expensesSink => _expensesStreamController.sink;
  Stream<List<Expense>> get streamExpenses => _expensesStreamController.stream;

  addExpense(Expense payload) =>
      expensesSink.add(repository.addExpense(payload));

  removeExpense(Expense payload) =>
      expensesSink.add(repository.removeExpense(payload));

  @override
  void dispose() {
    _expensesStreamController.close();
  }
}

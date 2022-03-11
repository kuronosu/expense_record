import 'dart:async';

import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/repository/expenses_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ExpensesBloc implements Bloc {
  late final ExpensesRepository repository;
  final _esController = StreamController<List<Expense>>();
  StreamSink<List<Expense>> get expensesSink => _esController.sink;
  Stream<List<Expense>> get streamExpenses => _esController.stream;

  ExpensesBloc() {
    repository = ExpensesRepository((e) => _esController.sink.add(e));
  }

  addExpense(Expense payload) => repository.addExpense(payload);

  removeExpense(Expense payload) => repository.removeExpense(payload);

  @override
  void dispose() {
    _esController.close();
  }
}

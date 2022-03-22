import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/repository/sqlite_repository.dart';

class ExpensesRepository {
  final void Function(List<Expense> data) onExpensesStreamListen;
  late final SqliteRepository _sqlite;

  ExpensesRepository(this.onExpensesStreamListen) {
    _sqlite = SqliteRepository(onExpensesStreamListen);
  }

  addExpense(Expense payload) => _sqlite.addExpense(payload);
  updateExpense(Expense payload) => _sqlite.updateExpense(payload);
  removeExpense(Expense payload) => _sqlite.removeExpense(payload);

  Future<List<Expense>> allExpenses() {
    return _sqlite.getAllExpense();
  }
}

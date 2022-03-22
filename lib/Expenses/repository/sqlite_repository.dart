import 'dart:async';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/database.dart';

class SqliteRepository {
  late AppDatabase db;

  void Function(List<Expense> data) onExpensesStreamListen;

  SqliteRepository(this.onExpensesStreamListen) {
    db = AppDatabase.getInstance();
    db.expenseDao.findAllExpensesAsStream().listen(onExpensesStreamListen);
  }

  addExpense(Expense expense) {
    db.expenseDao.insertExpense(expense);
  }

  updateExpense(Expense payload) {
    db.expenseDao.updateExpense(payload);
  }

  removeExpense(Expense payload) {
    db.expenseDao.deleteExpense(payload);
  }

  Future<List<Expense>> getAllExpense() async {
    return await db.expenseDao.findAllExpenses();
  }
}

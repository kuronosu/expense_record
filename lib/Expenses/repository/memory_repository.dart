import 'package:expense_record/Expenses/model/expense.dart';

class MemoryRepository {
  List<Expense> expenses = [];

  List<Expense> addExpense(Expense expense) {
    expenses.add(expense);
    return expenses;
  }

  List<Expense> removeExpense(expense) {
    expenses.remove(expense);
    return expenses;
  }
}

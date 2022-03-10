import 'package:expense_record/Expenses/model/expense.dart';

class MemoryRepository {
  List<Expense> expenses = [];

  List<Expense> addExpense(Expense expense) {
    expenses.add(expense);
    expenses.sort((a, b) => b.date.compareTo(a.date));
    return expenses;
  }

  List<Expense> removeExpense(expense) {
    expenses.remove(expense);
    return expenses;
  }
}

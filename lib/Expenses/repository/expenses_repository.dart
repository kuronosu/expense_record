import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/repository/memory_repository.dart';

class ExpensesRepository {
  final MemoryRepository _memory = MemoryRepository();
  List<Expense> addExpense(Expense payload) => _memory.addExpense(payload);

  List<Expense> removeExpense(Expense payload) => _memory.removeExpense(payload);
}

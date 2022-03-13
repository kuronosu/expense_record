import 'package:expense_record/Expenses/model/expense.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExpenseDao {
  @Query('SELECT * FROM Expense')
  Future<List<Expense>> findAllExpenses();

  @Query('SELECT * FROM Expense')
  Stream<List<Expense>> findAllExpensesAsStream();

  @Query('SELECT * FROM Expense WHERE id = :id')
  Stream<Expense?> findExpenseById(int id);

  @insert
  Future<void> insertExpense(Expense expense);

  @delete
  Future<void> deleteExpense(Expense expense);
}

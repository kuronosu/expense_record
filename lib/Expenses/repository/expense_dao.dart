import 'package:expense_record/Expenses/model/expense.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExpenseDao {
  @Query('SELECT * FROM Expense ORDER BY date DESC')
  Future<List<Expense>> findAllExpenses();

  @Query('SELECT * FROM Expense ORDER BY date DESC')
  Stream<List<Expense>> findAllExpensesAsStream();

  @Query('SELECT * FROM Expense WHERE id = :id')
  Stream<Expense?> findExpenseById(int id);

  @insert
  Future<void> insertExpense(Expense expense);

  @update
  Future<void> updateExpense(Expense expense);

  @delete
  Future<void> deleteExpense(Expense expense);
}

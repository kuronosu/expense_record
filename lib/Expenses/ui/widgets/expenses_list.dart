import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/ui/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key, required this.expenses}) : super(key: key);

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]),
      itemCount: expenses.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:expense_record/widgets/background.dart';
import 'package:expense_record/Expenses/ui/widgets/add_expense_from.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Background(
        child: SafeArea(
            child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('New expense'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AddExpenseForm(),
            ),
          ],
        )),
      ),
    );
  }
}

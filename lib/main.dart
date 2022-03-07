import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/exprense.dart';
import 'package:expense_record/Expenses/ui/screens/add_expense.dart';
import 'package:expense_record/utils/bloc_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExpensesPage(),
      routes: {
        '/add_expense': (_) => const AddExpense(),
      },
    );
  }
}

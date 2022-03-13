import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/exprense.dart';
import 'package:expense_record/Expenses/ui/screens/add_expense.dart';
import 'package:expense_record/database.dart';
import 'package:expense_record/widgets/loading_screen.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

final waiterFuture = Future.delayed(const Duration(milliseconds: 2000), () {});

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
      home: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          /// Add here all initialization actions here before the main interface is displayed
          waiterFuture,
          AppDatabase.getInstanceFuture(),
        ]),
        builder: (context, snapshot) {
          Widget child;
          if (snapshot.connectionState == ConnectionState.waiting) {
            child = const LoadingScreen();
          } else {
            child = BlocProvider(
              bloc: ExpensesBloc(),
              child: const ExpensesPage(),
            );
          }
          return AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: child,
          );
        },
      ),
      routes: {
        '/add_expense': (_) => const AddExpense(),
      },
    );
  }
}

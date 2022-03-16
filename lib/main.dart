import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/exprense.dart';
import 'package:expense_record/Expenses/ui/screens/add_expense.dart';
import 'package:expense_record/database.dart';
import 'package:expense_record/widgets/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: preloadActions,
      builder: (context, snapshot) {
        final child = snapshot.connectionState == ConnectionState.waiting
            ? loadingScreen
            : appScreen;
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: child,
        );
      },
    );
  }

  Widget get loadingScreen => const MaterialApp(
        title: 'Flutter Demo',
        home: LoadingScreen(),
      );

  Widget get appScreen => BlocProvider(
      bloc: ExpensesBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const ExpensesPage(),
        routes: {
          '/add_expense': (_) => const AddExpense(),
        },
      ));

  Future<List> get preloadActions => Future.wait([
        /// Add here all initialization actions here before the main interface is displayed
        Future.delayed(const Duration(milliseconds: 1000), () {}),
        AppDatabase.getInstanceFuture(),
      ]);
}

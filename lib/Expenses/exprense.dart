import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/ui/screens/expenses_review.dart';
import 'package:expense_record/Expenses/ui/screens/user_profile.dart';
import 'package:expense_record/app_color_scheme.dart';
import 'package:expense_record/utils/bloc_utils.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

BottomNavigationBarItem bnBarItem(String label, IconData icon) =>
    BottomNavigationBarItem(icon: Icon(icon), label: label);

class _ExpensesPageState extends State<ExpensesPage> {
  int indexTap = 0;
  final widgetsChildren = {
    withExpenseBloc(const ExpensesReview()):
        bnBarItem('Home', Icons.home_rounded),
    const UserProfile():
        bnBarItem('Profile', Icons.person_rounded),
  };

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colorScheme.bg1, colorScheme.bg2])),
          child: SafeArea(
              child: IndexedStack(
            index: indexTap,
            children: widgetsChildren.keys.toList(),
          ))),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            elevation: 0,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            unselectedItemColor: Colors.white70,
            showUnselectedLabels: false,
            currentIndex: indexTap,
            onTap: onTapTapped,
            items: widgetsChildren.values.toList(),
          )),
    );
  }
}

import 'package:expense_record/Expenses/ui/screens/expenses_review.dart';
import 'package:expense_record/Expenses/ui/screens/user_profile.dart';
import 'package:expense_record/app_color_scheme.dart';
import 'package:flutter/material.dart';

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
    const ExpensesReview(): bnBarItem('Home', Icons.home_outlined),
    const UserProfile(): bnBarItem('Profile', Icons.person_outline),
  };

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colorScheme.bg1, colorScheme.bg2])),
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: IndexedStack(
            index: indexTap,
            children: widgetsChildren.keys.toList(),
          )),
          bottomNavigationBar: BottomNavigationBar(
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

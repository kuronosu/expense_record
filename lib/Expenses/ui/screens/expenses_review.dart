import 'package:flutter/material.dart';

class ExpensesReview extends StatefulWidget {
  const ExpensesReview({Key? key}) : super(key: key);

  @override
  State<ExpensesReview> createState() => EexpensesReviewState();
}

class EexpensesReviewState extends State<ExpensesReview> {
  void _addExpense() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
          child:
              Text('Expenses review', style: TextStyle(color: Colors.white))),
      Positioned(
        bottom: 20,
        right: 20,
        child: FloatingActionButton.extended(
          onPressed: _addExpense,
          tooltip: 'Increment',
          icon: const Icon(Icons.add),
          label: const Text('Add Note'),
          // shape: OutlineInputBorder(),
        ),
      ),
    ]);
  }
}

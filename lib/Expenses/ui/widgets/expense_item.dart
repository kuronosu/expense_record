import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/ui/screens/edit_expense.dart';
import 'package:expense_record/utils/datetime_utils.dart';
import 'package:expense_record/widgets/circular_image.dart';
import 'package:expense_record/app_color_scheme.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({Key? key, required this.expense}) : super(key: key);
  final Expense expense;
  void onEditExpense(BuildContext context) {
    Navigator.pushNamed(
      context,
      EditExpense.routeName,
      arguments: expense,
    );
  }

  @override
  Widget build(BuildContext context) {
    const txtStyle = TextStyle(color: Colors.white70);
    final thumbnail = Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: CircularImage(
            size: 72, text: expense.description, img: expense.img));

    final card = Container(
        height: 104.0,
        margin: const EdgeInsets.only(left: 36),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.bgCard,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, top: 16, bottom: 16, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    expense.description,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white),
                  ),
                  ClipOval(
                    child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.edit),
                          // icon: const Icon(Icons.delete),
                          tooltip: 'Edit',
                          color: Colors.white,
                          onPressed: () => onEditExpense(context),
                        )),
                  ),
                ],
              ),
              Text(
                "\$${expense.price}",
                style: txtStyle,
              ),
              const Spacer(),
              Text(
                formatDateTime(expense.date),
                style: txtStyle,
              ),
            ],
          ),
        ));

    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            card,
            thumbnail,
          ],
        ));
  }

  String formatDateTime(DateTime dt) {
    var formatter = DateFormat.yMMMMd();
    if (!dt.isOnlyDate()) {
      formatter.addPattern(" - ");
      formatter.add_Hm();
    }
    return formatter.format(expense.date);
  }
}

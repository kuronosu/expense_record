import 'package:expense_record/Expenses/bloc/bloc_expenses.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/widgets/circular_image.dart';
import 'package:flutter/material.dart';
import 'package:expense_record/app_color_scheme.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem({Key? key, required this.expense}) : super(key: key);
  final Expense expense;

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  late ExpensesBloc _bloc;
  void onEditExpense() {
    _bloc.removeExpense(widget.expense);
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of(context);
    const txtStyle = TextStyle(color: Colors.white70);
    final thumbnail = Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: CircularImage(
            size: 72,
            text: widget.expense.description,
            img: widget.expense.img));

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
                    widget.expense.description,
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
                          // icon: const Icon(Icons.edit),
                          icon: const Icon(Icons.delete),
                          tooltip: 'Edit',
                          color: Colors.white,
                          onPressed: onEditExpense,
                        )),
                  ),
                ],
              ),
              Text(
                "\$${widget.expense.price}",
                style: txtStyle,
              ),
              const Spacer(),
              Text(
                DateFormat.yMMMMd().format(widget.expense.date),
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
}

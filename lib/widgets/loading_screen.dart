import 'package:expense_record/app_color_scheme.dart';
import 'package:expense_record/widgets/background.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: (MediaQuery.of(context).size.height),
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Background(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircularProgressIndicator(
            //   color: theme.colorScheme.loader,
            //   strokeWidth: 3,
            // ),
            Text(
              'Expenses record',
              style: theme.textTheme.displaySmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ],
        )));
  }
}

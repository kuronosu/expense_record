import 'package:expense_record/app_color_scheme.dart';
import 'package:expense_record/widgets/background.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key, this.withProgressIndicator = false})
      : super(key: key);
  final bool withProgressIndicator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Background(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            withProgressIndicator
                ? CircularProgressIndicator(
                    color: theme.colorScheme.loader,
                    strokeWidth: 3,
                  )
                : const SizedBox.shrink(),
            Text(
              'Expenses record',
              style: theme.textTheme.displaySmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ],
        )));
  }
}

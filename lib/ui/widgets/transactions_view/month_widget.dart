import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/utililties/month_int_to_string.dart';

////////////////////////// MONTH WIDGET //////////////////////////
/// This is the month widget.
/// Nicely displays the month according to the figma
/// Used in the transaction view

class MonthWidget extends StatelessWidget {
  int month;
  MonthWidget({ Key? key, required this.month }) : super(key: key);

  final double _topPadding = 16;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _topPadding),
      child: Text(monthIntToString(month),
        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey[700])
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/core/utililties/date_format_long.dart';
import 'package:swile_test_technique/core/utililties/number_format.dart';
import 'package:swile_test_technique/core/viewModels/transactions_view_model.dart';

/////////////////////// THE HEADLINE OF THE TRANSACTION //////////////////////
/// This is the headline of the transaction details.
/// It displays the transaction details.
/// The ammount, the category and date are displayed.

class TransactionHeadline extends StatelessWidget {
  TransactionHeadline({ Key? key }) : super(key: key);

  final TransactionsViewModel model = serviceLocator<TransactionsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(numberFormat(model.selectedTransaction!.amount), style: Theme.of(context).textTheme.headline1),
        SizedBox(height: 4,),
        Text(model.selectedTransaction!.name, style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w600)),
        SizedBox(height: 8,),
        Text(longDateFormat(model.selectedTransaction!.date), style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey[700])),
      ],
    );
  }
}
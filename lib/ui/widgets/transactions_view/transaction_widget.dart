import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/constants/routes_names.dart';
import 'package:swile_test_technique/core/models/transaction.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/core/utililties/date_format_short.dart';
import 'package:swile_test_technique/core/utililties/number_format.dart';
import 'package:swile_test_technique/core/utililties/short_string_format.dart';
import 'package:swile_test_technique/core/viewModels/transactions_view_model.dart';
import 'package:swile_test_technique/ui/shared/widgets/large_icon_widget.dart';
import 'package:swile_test_technique/ui/shared/widgets/small_icon_widget.dart';

/////////////////////////// TRANSACTIO WIDGET /////////////////////////////
/// This is the transaction widget.
/// It displays the transaction details over one line
/// It is a rows displaying
/// the large Icon and small icon
/// The name, message, date and ammount of the transaction

class TransactionWidget extends StatelessWidget {
  Transaction transaction;
  
  TransactionWidget({ Key? key, required this.transaction }) : super(key: key);

  final double _largeIconSize = 56;
  final double _borderWidth = 1;
  final double _radius = 22;
  final double _padding = 12;
  final double _highlightPadding = 4;
  final double _rightOffset = 4;

  TransactionsViewModel model = serviceLocator<TransactionsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _padding, bottom: _padding,),
      child: InkWell(
        onTap: (){
          model.SelectTransaction(transaction);
          Navigator.of(context).pushNamed(transactionDetailsViewRoute, arguments: {'transaction': transaction});
        },
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right:_padding),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  LargeIconWidget(transaction: transaction, width: _largeIconSize, height: _largeIconSize, radius: _radius, radiusTo: _radius, rightOffset: _rightOffset, borderWidth: _borderWidth,),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SmallIconWidget(transaction: transaction)
                  )
                ],
              )
            
            ),
            Expanded(child: 
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: _padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:_highlightPadding, bottom: _highlightPadding),
                        child: Text(transaction.name, style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:_highlightPadding, bottom: _highlightPadding),
                        child: 
                      Text(customShortStringFormat(
                        '${shortDateFormat(transaction.date)}${(transaction.message != null)?' • '+transaction.message!:''}'),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey[700])
                        )
                      )
                    ],
                  )
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: (transaction.amount<0)?Colors.transparent:Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.all(Radius.circular(9))
                  ),
                  padding: EdgeInsets.all(_highlightPadding),
                  child : Text(numberFormat(transaction.amount, symbol: transaction.currencySymbol),
                    style: (transaction.amount<0)?Theme.of(context).textTheme.bodyText1
                    :Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).hintColor)
                  )
                )
              ]
              ))
          ],
        ),
      )
    );
  }
}
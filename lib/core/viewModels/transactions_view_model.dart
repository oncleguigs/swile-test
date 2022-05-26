import 'package:flutter/material.dart';
import 'package:swile_test_technique/core/models/transaction.dart';
import 'package:swile_test_technique/core/services/api/api.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/ui/widgets/transactions_view/header_widget.dart';
import 'package:swile_test_technique/ui/widgets/transactions_view/month_widget.dart';
import 'package:swile_test_technique/ui/widgets/transactions_view/transaction_widget.dart';

///////////////////// THE TRANSACTIONS VIEW MODEL /////////////////////
/// This is the transactions view model.
/// It retrieve the transactions list from the api and then builds the list widgets.

class TransactionsViewModel extends ChangeNotifier {

  Api _api = serviceLocator<Api>();
  Transaction? _transactionSelected;

  List<Widget> _widgets = [];

  List<Transaction> get transactions => _api.transactions;
  Transaction? get selectedTransaction => _transactionSelected;     // The transaction selected by the user and displayed in the transaction details view
  List<Widget> get widgets => _widgets;

  init(){
    // Initialize the widgets list
    _buildWidgetsList();
  }

  _buildWidgetsList(){
    // Build the widgets list
    _widgets = [];
    _api.transactions.forEach((Transaction transaction){
      if(_widgets.isEmpty){
        _widgets.add(MonthWidget(month: transaction.date.month));
      }
      else if(transaction.date.month != _api.transactions[_api.transactions.indexOf(transaction)-1].date.month){
        _widgets.add(MonthWidget(month: transaction.date.month));
      }
      _widgets.add(TransactionWidget(transaction: transaction));
    });
    _widgets = <Widget>[HeaderWidget()] + _widgets;
  }

  Future<bool> loadMore() async{
    // Load more transactions from the api and rebuild the widgets list
    await _api.fetchMoreTransactions();
    _buildWidgetsList();
    notifyListeners();
    return true;
  }

  void SelectTransaction(Transaction transaction){
    // Select a transaction
    _transactionSelected = transaction;
  }
  
}
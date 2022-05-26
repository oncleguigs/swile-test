import 'package:flutter/cupertino.dart';
import 'package:swile_test_technique/core/services/api/api.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';
import 'package:swile_test_technique/ui/views/transactions_view.dart';

////////////////////////// THE MAIN MODEL OF THE APP ////////////////////////////
/// This is the main model of the app.
/// It loads the transactions list and then redirect to the transactions view.

class MainModel {

    Api _api = serviceLocator<Api>();

    Future <Widget>? fetchTransactions() async{

      bool transactionsFetchedSuccess = await _api.init();

      if(transactionsFetchedSuccess){
        return TransactionsView();
      }
      else{
        return Text('No data');
      }
    }
}
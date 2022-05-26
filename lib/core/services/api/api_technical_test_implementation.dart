import 'dart:convert';

import 'package:swile_test_technique/core/models/transaction.dart';
import 'package:swile_test_technique/core/services/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:swile_test_technique/core/services/local_storage/local_storage.dart';
import 'package:swile_test_technique/core/services/services_locator.dart';

///////////////////////// THE SPECIFIC TEST IMPLEMENTATION OF THE API////////////////////////////

class ApiTechnicalTestImplementation implements Api{

  List<Transaction> _transactions = [];
  Uri transactionsUri = Uri.parse("https://gist.githubusercontent.com/Aurazion/365d587f5917d1478bf03bacabdc69f3/raw/3c92b70e1dc808c8be822698f1cbff6c95ba3ad3/transactions.json");

  get transactions => _transactions;

  LocalStorage _localStorage = serviceLocator<LocalStorage>();
  
  @override
  Future <bool> init() async{
    /// This init method initialize the api by loading the transactions
    _transactions = [];
    List <Transaction> newTransactions = await fetchTransactions(page:0);
    print(newTransactions.length);
    await _addTransactions(newTransactions);
    //_sortTransactionsByDate();                                            // I implemented the sorting method, but since we used the same transactions list 
                                                                            //for unlimited paginatio, it doesnt makes sense
    return true;
  }

  Future <List<Transaction>> fetchTransactions({int? page}) async{
    /// This method fetch the transactions from the api or local storage if no internet 
    /// and return the list of transactions
    List<Transaction> _t = [];
    late http.Response response;
    try {
       response = await http.get(transactionsUri);
        jsonDecode(response.body)['transactions'].forEach((transactionData){
        _t.add(Transaction.fromDatas(transactionData));
      });
    } catch (e) {
      print(e);
      var transactions = await _localStorage.loadTransactions();
      transactions['transactions'].forEach((transactionData){
        _t.add(Transaction.fromDatas(transactionData));
      }); 
    } 
    return _t;
  }

  Future fetchMoreTransactions({int? page}) async{
    /// This method fetch more transactions from the api or local storage if no internet
    List <Transaction> newTransactions = await fetchTransactions(page: page);
    await _addTransactions(newTransactions);
  }

  Future _addTransactions(List<Transaction> newTransactions) async{
    /// This method add the new transactions to the transactions list and save it in local storage
    _transactions.addAll(newTransactions);
    await _localStorage.saveTransactions(_transactions);
  }

  _sortTransactionsByDate(){
    /// This method sort the transactions list by date
    _transactions.sort((a,b) {return b.date.difference(a.date).inMilliseconds;});
  }
}
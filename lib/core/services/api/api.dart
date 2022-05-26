import 'package:swile_test_technique/core/models/transaction.dart';

//////////////////////////// THE SERVICE COMMUNICATING WITH THE API ////////////////////////////

abstract class Api{

  get transactions;

  Future <bool> init();                                     // Initialize the api
  Future <List<Transaction>> fetchTransactions({int? page}); // fetch the transactions list and return true if success. Added page parameter to fetch more transactions in prevision of the pagination
  Future fetchMoreTransactions({int? page});                // fetch more transactions and return true if success.
}
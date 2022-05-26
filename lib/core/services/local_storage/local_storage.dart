import 'package:swile_test_technique/core/models/transaction.dart';

//////////////////////////// LOCAL STORAGE SERVICE ////////////////////////////

abstract class LocalStorage {

  Future<bool> init();                                              // Initialize the local storage service          
  Future<bool> saveTransactions(List<Transaction> transactions);    // Save the transactions list and return true if success.
  Future<Map> loadTransactions();                                   // Load the transactions list and return true if success.
  
}
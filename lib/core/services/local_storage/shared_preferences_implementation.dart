import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:swile_test_technique/core/models/transaction.dart';
import 'package:swile_test_technique/core/services/local_storage/local_storage.dart';

///////////////////THE SHARED PREFERENCES IMPLEMENTATION OF LOCAL STORAG/////////////////////

class SharedPreferencesImplementation implements LocalStorage {

  late SharedPreferences prefs;

  Future<bool> init() async {
    /// This init method initialize the local storage service
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  Future<bool> saveTransactions(List<Transaction> transactions) async{
    /// This method save the transactions list and return true if success.
    await init();
    bool success = await prefs.setStringList('transactions' ,
      transactions.map<String>((t) => jsonEncode(t.toMap())).toList()      // before storing it we must encode it as a json
    );
    return success;
  }

  Future<Map> loadTransactions() async{
    /// This method load the transactions list and return true if success.
    await init();
    List<String> _transactions = [];
    try {
      _transactions = await prefs.getStringList('transactions')!.toList();
    } catch (e) {
      print(e);
    }
    return {'transactions': _transactions.map((e) => jsonDecode(e) as Map<String, dynamic>).toList()};  // we must decode it as a json
  }

  @override
  removeTransactions() async{
    /// This method remove the transactions list from storage and return true if success.
    await prefs.remove('transactions');
  }
}
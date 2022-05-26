import 'package:swile_test_technique/core/constants/categories_map.dart';
import 'package:swile_test_technique/core/models/category.dart';

//////////////////////// TRANSACTION CLASS ////////////////////////
/// Matching the transaction sendt by the API

class Transaction {

  late String name;                                               // The name of the transaction
  late String type;                                               // The type of the transaction
  late DateTime date;                                             // The date of the transaction
  late String? message;                                           // The message of the transaction
  late double amount;                                             // The amount of the transaction
  late String currencySymbol;                                     // The currency symbol of the transaction
  late String? smallIconUrl;                                      // The small icon url of the transaction
  late Category smallIconCategory;                                // The small icon category of the transaction
  late String? largeIconUrl;                                      // The large icon url of the transaction
  late Category largeIconCategory;                                // The large icon category of the transaction
  late DateTime createdAt;                                        // The timestamp when the Transaction has been created, used for hero Tag differenciation because of unlimited pagination

  Transaction.fromDatas(transactionData){
    /// This constructor is used to create a transaction from transaction data 
    name = transactionData['name'];
    type = transactionData['type'];
    date = DateTime.parse(transactionData['date']);
    message = transactionData['message'];
    amount = transactionData['amount']['value'].toDouble();
    currencySymbol = transactionData['amount']['currency']['symbol'];
    smallIconUrl = transactionData['small_icon']['url'];
    smallIconCategory = categoriesMap[transactionData['small_icon']['category']??'unknown']!;
    largeIconUrl = transactionData['large_icon']['url'];
    largeIconCategory = categoriesMap[transactionData['large_icon']['category']??'unknown']!;
    createdAt = DateTime.now();
  }

  Map toMap(){
    /// This method is used to convert a transaction to a map before store it locally
    return{
      "name": name, 
      "type": type, 
      "date": date.toIso8601String(), 
      "message": message, 
      "amount": {
        "value": amount, 
        "currency": {
          "symbol": currencySymbol, 
          }
        }, 
      "small_icon": {
        "url": null,
        "category": smallIconCategory.name
      }, 
      "large_icon": {
        "url": null,
        "category": largeIconCategory.name
      }
    };
  }
}
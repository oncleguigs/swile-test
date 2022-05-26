import 'package:intl/intl.dart';

String numberFormat(num number, {String symbol='€'}){
  /// This function is used to format a number to a format fitting the figma UI
  return ((number>0)?' +':'') + NumberFormat.currency(
    locale: 'eu', 
    symbol: symbol,
    decimalDigits: (number == number.toInt())?0:2
  ).format(number);
}
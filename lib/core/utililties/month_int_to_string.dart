import 'package:intl/intl.dart';

String monthIntToString(int month){
  /// This function is used to convert a month number to a month name
  final DateTime date = DateTime(2022, month);
  final DateFormat formatter = DateFormat('MMMM');
  final String formatted = formatter.format(date);
  return formatted;
}
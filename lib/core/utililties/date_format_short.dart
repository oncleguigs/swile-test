import 'package:intl/intl.dart';

String shortDateFormat(DateTime date) {
  /// This function is used to format a date to a format fitting the figma UI
  final DateFormat formatter = DateFormat('dd MMMM');
  final String formatted = formatter.format(date);
  return formatted;
}
import 'package:intl/intl.dart';

String longDateFormat(DateTime date) {
  /// This function is used to format a date to a format fitting the figma UI
  final DateFormat formatter = DateFormat('EEEE d MMMM, hh:mm');
  final String formatted = formatter.format(date);
  return formatted;
}
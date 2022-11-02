import 'package:intl/intl.dart';

class DateTextFormatter {
  static String dateStringToPtBrWithSeparators(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  static String dateStringToPtBrWithHmsAndSeparators(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat formatter = DateFormat('dd/MM/yyyy H:m:s');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  static String dateStringPtBrToEnUs(String date) {
    DateTime datePtBr = DateFormat('dd/MM/yyyy').parse(date);
    return DateFormat('yyyy-MM-dd').format(datePtBr); // 2019-08-18
  }
}

import 'package:intl/intl.dart';

class $Number {
  static numberFormat(number) {
    // final formatter = new NumberFormat("#,###");
    final formatter = NumberFormat.currency(symbol: '', decimalDigits: 0).format(number);
    return formatter;
  }

  static absVal(integer) {
    return integer < 0 ? -integer : integer;
  }

  static typeSubject(type) {
    return type == 0 ? '+' : '-';
  }
}

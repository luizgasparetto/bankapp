import 'package:intl/intl.dart';

class Formatter {
  static String numberFormat(double number) {
    return NumberFormat.currency(
            locale: 'pt-BR', decimalDigits: 2, symbol: 'R\$')
        .format(number);
  }
}

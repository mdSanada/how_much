import 'package:intl/intl.dart';

import '../consts/locale.dart';

class NumberFormatter {
  static final NumberFormat formatter = NumberFormat.decimalPatternDigits(
    locale: LocaleConst.locale,
    decimalDigits: 0,
  );

  static String stringfy(double value) {
    final formatted = formatter.format(value);
    return formatted;
  }
}

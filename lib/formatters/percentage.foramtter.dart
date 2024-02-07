import 'package:intl/intl.dart';

import '../consts/locale.dart';

class PercentageFormatter {
  static final NumberFormat formatter = NumberFormat.percentPattern(
    LocaleConst.locale,
  );

  static String stringfy(double value) {
    if (value != 0) {
      value = value / 100;
    }
    final formatted = formatter.format(value);
    return formatted;
  }
}

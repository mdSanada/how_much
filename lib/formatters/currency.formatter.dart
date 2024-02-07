import 'dart:core';
import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

import '../consts/locale.dart';

class CurrencyFormatter {
  static CurrencyTextInputFormatter formatter() {
    return CurrencyTextInputFormatter(
      locale: LocaleConst.locale,
      symbol: LocaleConst.currencySymbol,
      decimalDigits: 2,
      enableNegative: false,
    );
  }

  static String number(double value, CurrencyTextInputFormatter formatter) {
    final formatted = formatter.formatDouble(value);
    return formatted;
  }

  static String format(String value, CurrencyTextInputFormatter formatter) {
    final formatted = formatter.format(value);
    return formatted;
  }

  static num lastValue(CurrencyTextInputFormatter formatter) {
    final double = formatter.getUnformattedValue();
    return double;
  }

  static num value(String value, CurrencyTextInputFormatter formatter) {
    num newNum = 0;

    final NumberFormat format = NumberFormat.currency(
      locale: formatter.locale,
      name: formatter.name,
      symbol: formatter.symbol,
      decimalDigits: formatter.decimalDigits,
      customPattern: formatter.customPattern,
    );
    if (formatter.turnOffGrouping) {
      format.turnOffGrouping();
    }
    final String newText = value.replaceAll(RegExp('[^0-9]'), '');

    newNum = num.tryParse(newText) ?? 0;
    if (format.decimalDigits! > 0) {
      newNum /= pow(10, format.decimalDigits!);
    }

    return newNum;
  }
}

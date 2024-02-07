import 'package:how_much/consts/strings.dart';
import 'package:how_much/formatters/currency.formatter.dart';
import 'package:how_much/validator/validator.dart';

import '../calculator/calculator.dart';

class ValidatorForms {
  static String? validateName(String? value) {
    if (!Validator.validateName(value)) {
      return StringsConsts.formNameError;
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (!Validator.validateDescription(value)) {
      return StringsConsts.formDescriptionError;
    }
    return null;
  }

  static String? validateCost(String? value) {
    if (value == null || value.isEmpty) {
      return StringsConsts.formCostError;
    }

    final formatter = CurrencyFormatter.formatter();
    final currency = CurrencyFormatter.value(value, formatter);
    final formattedValue = currency.toDouble();

    if (!Validator.validateCost(formattedValue)) {
      return StringsConsts.formCostError;
    }
    return null;
  }

  static String? validateQuantity(String? value) {
    final formattedValue = double.tryParse(value ?? '0.0') ?? 0.0;
    if (!Validator.validateQuantity(formattedValue)) {
      return StringsConsts.formQuantityError;
    }
    return null;
  }

  static String? validateMeasure(Measures? value) {
    if (!Validator.validateMeasure(value)) {
      return StringsConsts.formQuantityError;
    }
    return null;
  }
}

import '../calculator/calculator.dart';

class Validator {
  static bool validateName(String? value) {
    return (value != null && (value.isNotEmpty));
  }

  static bool validateDescription(String? value) {
    return (value != null && (value.isNotEmpty));
  }

  static bool validateCost(double? value) {
    return (value != null && (value > 0));
  }

  static bool validateQuantity(double? value) {
    return (value != null && (value > 0));
  }

  static bool validateMeasure(Measures? value) {
    return (value != null);
  }
}

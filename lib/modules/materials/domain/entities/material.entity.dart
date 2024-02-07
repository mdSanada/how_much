import 'package:equatable/equatable.dart';

import '../../../../calculator/calculator.dart';
import '../../../../validator/validator.dart';

class MaterialEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double quantity;
  final Measures measure;

  const MaterialEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.measure,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        quantity,
        measure,
      ];

  static MaterialEntity empty() {
    return const MaterialEntity(
      id: '',
      name: '',
      price: 0.0,
      description: '',
      quantity: 0.0,
      measure: Measures.unity,
    );
  }

  MaterialEntity copy({
    String? id,
    String? name,
    double? price,
    String? description,
    double? quantity,
    Measures? measure,
  }) {
    return MaterialEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      measure: measure ?? this.measure,
    );
  }

  bool validate() {
    final nameIsValid = Validator.validateName(name);
    final descriptionIsValid = Validator.validateDescription(description);
    final priceIsValid = Validator.validateCost(price);
    final quantityIsValid = Validator.validateQuantity(quantity);
    final measureIsValid = Validator.validateMeasure(measure);
    return nameIsValid &&
        descriptionIsValid &&
        priceIsValid &&
        quantityIsValid &&
        measureIsValid;
  }

  Map<String, dynamic> toJson() {
    CalculatorProtocol calculator = Calculator();

    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': calculator.toDefault(measure, quantity),
      'measure': MeasuresManager.stringfy(measure),
    };
  }

  factory MaterialEntity.fromJson(Map<String, dynamic> json) {
    CalculatorProtocol calculator = Calculator();
    final measure = Measures.values.firstWhere(
        (measure) => measure == MeasuresManager.toMeasure(json['measure']));

    return MaterialEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: calculator.fromDefault(measure, json['quantity']),
      measure: measure,
    );
  }
}

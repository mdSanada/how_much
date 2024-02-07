import 'package:equatable/equatable.dart';
import 'package:how_much/calculator/calculator.dart';

import '../../../../validator/validator.dart';

class MaterialEntity extends Equatable {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final Measures measure;

  const MaterialEntity({
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.measure,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        price,
        quantity,
        measure,
      ];

  static MaterialEntity empty() {
    return const MaterialEntity(
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
    return {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'measure': measure.toString(),
    };
  }

  factory MaterialEntity.fromJson(Map<String, dynamic> json) {
    return MaterialEntity(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      measure: Measures.values.firstWhere(
          (measure) => measure == MeasuresManager.toMeasure(json['measure'])),
    );
  }
}

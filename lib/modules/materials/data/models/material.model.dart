import 'package:how_much/calculator/calculator.dart';
import 'package:how_much/modules/materials/domain/entities/material.entity.dart';

class MaterialModel extends MaterialEntity {
  final String id;

  const MaterialModel({
    required this.id,
    required super.name,
    required super.price,
    required super.description,
    required super.quantity,
    required super.measure,
  });

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    CalculatorProtocol calculator = Calculator();
    final measure = MeasuresManager.toMeasure(json['measure']);
    return MaterialModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      quantity: calculator.fromDefault(measure, json['quantity']),
      measure: measure,
    );
  }

  factory MaterialModel.fromEntity(MaterialEntity entity) {
    return MaterialModel(
      id: '',
      name: entity.name,
      price: entity.price,
      description: entity.description,
      quantity: entity.quantity,
      measure: entity.measure,
    );
  }

  Map<String, dynamic> toJson() {
    CalculatorProtocol calculator = Calculator();

    final body = {
      'name': name,
      'price': price,
      'description': description,
      'quantity': calculator.toDefault(measure, quantity),
      'measure': MeasuresManager.stringfy(measure),
    };

    if (id.isNotEmpty) {
      body['id'] = id;
    }

    return body;
  }
}

import '../../../../calculator/calculator.dart';
import '../../domain/entities/material.entity.dart';

class MaterialModel extends MaterialEntity {
  const MaterialModel({
    required super.id,
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
      id: entity.id,
      name: entity.name,
      price: entity.price,
      description: entity.description,
      quantity: entity.quantity,
      measure: entity.measure,
    );
  }

  @override
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

import 'package:how_much/calculator/calculator.dart';

import '../../../materials/domain/entities/material.entity.dart';

class ProductMaterialEntity {
  final double quantity;
  final Measures measure;
  final MaterialEntity material;

  ProductMaterialEntity({
    required this.quantity,
    required this.measure,
    required this.material,
  });

  Map<String, dynamic> toJSON() {
    CalculatorProtocol calculator = Calculator();
    return {
      'quantity': calculator.toDefault(measure, quantity),
      'measure': MeasuresManager.stringfy(measure),
      'material': material.toJson(),
    };
  }

  factory ProductMaterialEntity.fromJSON(Map<String, dynamic> json) {
    CalculatorProtocol calculator = Calculator();
    final measure = Measures.values.firstWhere(
        (measure) => measure == MeasuresManager.toMeasure(json['measure']));
    return ProductMaterialEntity(
      quantity: calculator.fromDefault(measure, json['quantity']),
      measure: measure,
      material: MaterialEntity.fromJson(json['material']),
    );
  }
}

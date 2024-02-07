import 'package:how_much/modules/home/domain/entities/product.material.entity.dart';
import 'package:how_much/modules/home/domain/entities/product.profit.entity.dart';

import '../../domain/entities/product.entity.dart';

class ProductModel extends ProductEntity {
  final String id;

  const ProductModel({
    required this.id,
    required super.name,
    required super.description,
    required super.profit,
    required super.amount,
    required super.materials,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: '',
      name: entity.name,
      description: entity.description,
      profit: entity.profit,
      amount: entity.amount,
      materials: entity.materials,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      profit: ProductProfitEntity.fromJson(json['profit']),
      amount: json['amount'],
      materials: (json['materials'] as List<dynamic>)
          .map((item) => ProductMaterialEntity.fromJSON(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'profit': profit.toJson(),
      'amount': amount,
      'materials': materials.map((e) => e.toJSON()).toList(),
    };
  }
}

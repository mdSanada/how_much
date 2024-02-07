import 'package:equatable/equatable.dart';

import 'product.material.entity.dart';
import 'product.profit.entity.dart';

class ProductEntity extends Equatable {
  final String name;
  final String description;
  final ProductProfitEntity profit;
  final int amount;
  final List<ProductMaterialEntity> materials;

  const ProductEntity({
    required this.name,
    required this.description,
    required this.profit,
    required this.amount,
    required this.materials,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        profit,
        amount,
        materials,
      ];
}

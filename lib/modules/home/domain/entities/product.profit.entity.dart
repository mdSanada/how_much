import 'package:how_much/modules/home/domain/entities/profit.type.dart';

class ProductProfitEntity {
  final ProfitType type;
  final double value;

  ProductProfitEntity({
    required this.type,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'value': value,
    };
  }

  factory ProductProfitEntity.fromJson(Map<String, dynamic> json) {
    return ProductProfitEntity(
      type: ProfitType.values.firstWhere(
          (type) => type.toString().split('.').last == json['type']),
      value: json['value'],
    );
  }
}

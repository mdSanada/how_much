import 'package:equatable/equatable.dart';

import '../../../../calculator/calculator.dart';
import '../../../../formatters/currency.formatter.dart';
import 'product.material.entity.dart';
import 'product.profit.entity.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final ProductProfitEntity profit;
  final int amount;
  final List<ProductMaterialEntity> materials;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.profit,
    required this.amount,
    required this.materials,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        profit,
        amount,
        materials,
      ];

  double unitPrice() {
    final CalculatorProtocol calculator = Calculator();
    final cost = _calculateMaterialCost();

    final price = calculator.calculatePrice(
      profit.type,
      profit.value,
      cost,
    );

    return price;
  }

  double unitCost() {
    final cost = _calculateMaterialCost() / amount;
    return cost;
  }

  double unitRevenue() {
    final revenue = unitPrice() - unitCost();
    return revenue;
  }

  double totalProfit() {
    final CalculatorProtocol calculator = Calculator();

    final cost = _calculateMaterialCost();
    final profitType = this.profit.type;
    final profitValue = this.profit.value;

    final profit = calculator.calculateProfit(
      profitType,
      profitValue,
      cost,
    );

    return profit;
  }

  double totalCost() {
    final price = _calculateMaterialCost();

    return price;
  }

  double totalRevenue() {
    final total = unitPrice() * amount;
    final cost = _calculateMaterialCost();
    return total - cost;
  }

  double _calculateMaterialCost() {
    final CalculatorProtocol calculator = Calculator();

    final materials = this.materials;
    final materialsCost = calculator.calculateMaterialCost(materials);
    return materialsCost;
  }
}

  // @action
  // String getUnitValue() {
  //   final (price, _) = calculatePriceAndProfit();

  //   final totalPrice = price;

  //   final totalProfit = CurrencyFormatter.number(
  //     totalPrice,
  //     currencyFormatter,
  //   );

  //   return totalProfit;
  // }

  // @action
  // String getUnitPercentage() {
  //   final (_, profit) = calculatePriceAndProfit();

  //   final percentage = PercentageFormatter.stringfy(profit);

  //   return percentage;
  // }

  // @action
  // List<KeyValue> getTotalSection() {
  //   final totalCost = calculateMaterialCost();
  //   final (price, profit) = calculatePriceAndProfit();

  //   final totalPrice = price * (product?.amount ?? 1);

  //   final amount =
  //       CurrencyFormatter.number(totalCost.toDouble(), currencyFormatter);

  //   final percentage = PercentageFormatter.stringfy(profit);

  //   final totalProfit = CurrencyFormatter.number(
  //     totalPrice - totalCost,
  //     currencyFormatter,
  //   );

  //   return [
  //     KeyValue(key: "Redimento", value: product?.amount.toString() ?? ""),
  //     KeyValue(key: "Lucro (%)", value: percentage),
  //     KeyValue(key: "Custo Total", value: amount),
  //     KeyValue(key: "Lucro Total (R\$)", value: totalProfit),
  //   ];
  // }


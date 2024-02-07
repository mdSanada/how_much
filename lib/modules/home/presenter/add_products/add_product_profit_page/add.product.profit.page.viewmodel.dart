import 'package:how_much/calculator/calculator.dart';
import 'package:how_much/modules/home/domain/entities/product.profit.entity.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/profit.type.dart';
import '../add.products.viewmodel.dart';

part 'add.product.profit.page.viewmodel.g.dart';

class AddProductProfitViewModel = AddProductProfitViewModelBase
    with _$AddProductProfitViewModel;

abstract class AddProductProfitViewModelBase with Store {
  @observable
  ProfitType profitType = ProfitType.percentage;

  @observable
  double value = 0;

  @observable
  double actualCost = 0;

  @observable
  double actualPrice = 0;

  @observable
  double actualProfit = 0;

  AddProductsViewModel? controller;
  CalculatorProtocol calculator = Calculator();

  @action
  configure(AddProductsViewModel controller) {
    profitType = controller.profit?.type ?? ProfitType.percentage;
    value = controller.profit?.value ?? 0;
    this.controller = controller;
    calculate();
  }

  @action
  void setProfitType(ProfitType profit) {
    profitType = profit;
    value = 0;
    update();
    calculate();
  }

  @action
  void setValue(double value) {
    this.value = value;
    update();
    calculate();
  }

  @action
  calculate() {
    actualCost = calculateMaterialCost();
    final (price, profit) = calculatePriceAndProfit();
    actualPrice = price;
    actualProfit = profit;
  }

  double calculateMaterialCost() {
    final materials = controller?.material ?? [];
    final materialsCost = calculator.calculateMaterialCost(materials);
    return materialsCost;
  }

  (double, double) calculatePriceAndProfit() {
    final (price, profit) = calculator.calculatePriceAndProfit(
      profitType,
      value,
      actualCost,
    );
    return (price, profit);
  }

  @action
  void update() {
    final profit = ProductProfitEntity(
      type: profitType,
      value: value,
    );
    controller?.setProfit(profit);
  }
}

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

import '../../../../calculator/calculator.dart';
import '../../../../consts/strings.dart';
import '../../../../core/logger.dart';
import '../../../../formatters/currency.formatter.dart';
import '../../../../formatters/percentage.foramtter.dart';
import '../../../../widgets/inset_grouped/key.value.model.dart';
import '../../domain/entities/product.entity.dart';
import '../../domain/usecase/crud.product.dart';

part 'products.detail.viewmodel.g.dart';

class ProductsDetailViewModel = ProductsDetailViewModelBase
    with _$ProductsDetailViewModel;

abstract class ProductsDetailViewModelBase with Store {
  @observable
  ProductEntity? product;

  final CrudProductUseCase productsUseCase;
  final CalculatorProtocol calculator = Calculator();
  final CurrencyTextInputFormatter currencyFormatter =
      CurrencyFormatter.formatter();

  ProductsDetailViewModelBase({
    required this.productsUseCase,
  });

  @action
  Future<void> configureProduct(ProductEntity product) async {
    this.product = product;
  }

  @action
  Future<ProductEntity?> getProduct(
    String id,
  ) async {
    final wrapper = await productsUseCase.read(id);
    ProductEntity? product;
    wrapper.fold(
      (failure) {
        product = null;
        Logger.log(failure);
      },
      (data) {
        product = data;
      },
    );
    this.product = product;
    return product;
  }

  Future<bool> deleteProduct(String id) async {
    if (id.isEmpty) {
      return false;
    }
    var didDelete = false;
    final wrapper = await productsUseCase.delete(id);
    wrapper.fold(
      (failure) {
        Logger.log(failure);
      },
      (data) {
        Logger.log(data);
        didDelete = true;
      },
    );
    return didDelete;
  }

  @action
  String getUnitValue() {
    final totalPrice = product?.unitPrice() ?? 0.0;

    final totalProfit = CurrencyFormatter.number(
      totalPrice,
      currencyFormatter,
    );

    return totalProfit;
  }

  @action
  String getUnitPercentage() {
    final profit = product?.totalProfit() ?? 0.0;
    final percentage = PercentageFormatter.stringfy(profit);

    return percentage;
  }

  @action
  List<KeyValue> getTotalSection() {
    final profit = product?.totalProfit() ?? 0.0;
    final totalPrice = product?.totalRevenue() ?? 0.0;
    final totalCost = product?.totalCost() ?? 0.0;

    final amount = CurrencyFormatter.number(
      totalCost,
      currencyFormatter,
    );

    final percentage = PercentageFormatter.stringfy(profit);

    final revenue = CurrencyFormatter.number(
      totalPrice,
      currencyFormatter,
    );

    return [
      KeyValue(
          key: StringsConsts.revenue, value: product?.amount.toString() ?? ""),
      KeyValue(key: StringsConsts.profit, value: percentage),
      KeyValue(key: StringsConsts.totalCost, value: amount),
      KeyValue(key: StringsConsts.totalRevenue, value: revenue),
    ];
  }

  @action
  List<KeyValue> getUnitSection() {
    final unitCost = product?.unitCost() ?? 0.0;
    final unitRevenue = product?.unitRevenue() ?? 0.0;

    final amount = CurrencyFormatter.number((unitCost), currencyFormatter);

    final unitProfit = CurrencyFormatter.number(
      unitRevenue,
      currencyFormatter,
    );

    return [
      KeyValue(key: StringsConsts.costPerUnit, value: amount),
      KeyValue(key: StringsConsts.revenueWithSymbol, value: unitProfit),
    ];
  }

  @action
  List<KeyValue> getMaterialsSection() {
    final materials = product?.materials ?? [];
    final list = materials
        .map(
          (e) => KeyValue(
            key: e.material.name,
            value:
                "${e.quantity} ${MeasuresManager.stringfy(e.material.measure)}",
          ),
        )
        .toList();
    return list;
  }
}

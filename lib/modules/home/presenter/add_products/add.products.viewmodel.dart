import 'package:how_much/core/logger.dart';
import 'package:how_much/modules/home/domain/entities/product.entity.dart';
import 'package:how_much/modules/home/domain/entities/product.material.entity.dart';
import 'package:how_much/modules/home/domain/entities/profit.type.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/product.description.entity.dart';
import '../../domain/entities/product.profit.entity.dart';
import '../../domain/usecase/crud.product.dart';

part 'add.products.viewmodel.g.dart';

class AddProductsViewModel = AddProductsViewModelBase
    with _$AddProductsViewModel;

abstract class AddProductsViewModelBase with Store {
  final CrudProductUseCase useCase;

  @observable
  ProductDescriptionEntity? description;

  @observable
  List<ProductMaterialEntity> material = [];

  @observable
  ProductProfitEntity? profit;

  AddProductsViewModelBase({required this.useCase});

  @action
  configure() async {}

  @action
  void setDescription(ProductDescriptionEntity description) {
    this.description = description;
    Logger.log(description);
  }

  @action
  void setMaterial(List<ProductMaterialEntity> material) {
    this.material = material;
  }

  @action
  void setProfit(ProductProfitEntity profit) {
    this.profit = profit;
  }

  @action
  Future<void> saveProduct() async {
    final product = ProductEntity(
      name: description?.name ?? "Produto",
      amount: description?.quantity.toInt() ?? 1,
      description: description?.description ?? "Descrição",
      profit:
          profit ?? ProductProfitEntity(type: ProfitType.percentage, value: 20),
      materials: material,
    );
    await useCase.create(product);
  }
}

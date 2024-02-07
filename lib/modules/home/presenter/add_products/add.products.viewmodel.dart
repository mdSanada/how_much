import 'package:flutter/material.dart';
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
  bool isEditing = false;

  @observable
  bool isLoading = false;

  @observable
  ProductProfitEntity? profit;

  String? id;

  AddProductsViewModelBase({required this.useCase});

  @action
  configure({ProductEntity? product}) async {
    if (product != null) {
      setDescription(ProductDescriptionEntity(
        name: product.name,
        description: product.description,
        quantity: product.amount.toDouble(),
      ));
      setMaterial(product.materials);
      setProfit(product.profit);
      id = product.id;
      isEditing = true;
    }
  }

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
  Future<void> saveProduct(BuildContext context) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    final product = ProductEntity(
      id: id ?? "",
      name: description?.name ?? "Produto",
      amount: description?.quantity.toInt() ?? 1,
      description: description?.description ?? "Descrição",
      profit:
          profit ?? ProductProfitEntity(type: ProfitType.percentage, value: 20),
      materials: material,
    );

    if (isEditing) {
      await useCase.edit(product);
    } else {
      await useCase.create(product);
    }

    isLoading = false;
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  bool validateDescription() {
    if (description == null) {
      return false;
    }
    return true;
  }

  bool validateMaterial() {
    if (material.isEmpty || material.length <= 1) {
      return false;
    }
    return true;
  }

  bool validateProfit() {
    if (profit == null) {
      return false;
    }
    return true;
  }
}

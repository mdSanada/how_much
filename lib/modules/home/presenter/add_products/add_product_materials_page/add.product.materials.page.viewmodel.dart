import 'package:how_much/modules/materials/domain/entities/material.entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../../calculator/calculator.dart';
import '../../../domain/entities/product.material.entity.dart';
import '../add.products.viewmodel.dart';

part 'add.product.materials.page.viewmodel.g.dart';

class AddProductMaterialsViewModel = AddProductMaterialsViewModelBase
    with _$AddProductMaterialsViewModel;

abstract class AddProductMaterialsViewModelBase with Store {
  @observable
  List<ProductMaterialEntity> materials = [];

  AddProductsViewModel? controller;

  @action
  configure(AddProductsViewModel controller) {
    materials = controller.material;
    this.controller = controller;
  }

  @action
  void addMaterial(
    MaterialEntity material,
    Measures measures,
    double quantity,
    int? index,
  ) {
    if (index != null) {
      materials.removeAt(index);
      materials.insert(
        index,
        ProductMaterialEntity(
          quantity: quantity,
          measure: measures,
          material: material,
        ),
      );
    } else {
      materials.add(
        ProductMaterialEntity(
          quantity: quantity,
          measure: measures,
          material: material,
        ),
      );
    }
    update();
  }

  @action
  void removeMaterial(int index) {
    materials.removeAt(index);
    update();
  }

  @action
  void update() {
    controller?.setMaterial(materials);
  }
}

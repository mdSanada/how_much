import 'package:how_much/modules/home/domain/entities/product.description.entity.dart';
import 'package:mobx/mobx.dart';

import '../add.products.viewmodel.dart';

part 'add.product.description.page.viewmodel.g.dart';

class AddProductDescriptionViewModel = AddProductDescriptionViewModelBase
    with _$AddProductDescriptionViewModel;

abstract class AddProductDescriptionViewModelBase with Store {
  @observable
  String name = '';

  @observable
  String description = '';

  @observable
  double quantity = 0;

  AddProductsViewModel? controller;

  @action
  configure(AddProductsViewModel controller) {
    name = controller.description?.name ?? '';
    description = controller.description?.description ?? '';
    quantity = controller.description?.quantity ?? 0;
    this.controller = controller;
  }

  @action
  void setName(String value) {
    name = value;
    update();
  }

  @action
  void setDescription(String value) {
    description = value;
    update();
  }

  @action
  void setQuantity(double value) {
    quantity = value;
    update();
  }

  @action
  void update() {
    final productDescription = ProductDescriptionEntity(
      name: name,
      description: description,
      quantity: quantity,
    );
    controller?.setDescription(productDescription);
  }
}

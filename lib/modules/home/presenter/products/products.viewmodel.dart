import 'package:mobx/mobx.dart';

import '../../../../core/logger.dart';
import '../../domain/entities/product.entity.dart';
import '../../domain/usecase/crud.product.dart';

part 'products.viewmodel.g.dart';

class ProductsViewModel = ProductsViewModelBase with _$ProductsViewModel;

abstract class ProductsViewModelBase with Store {
  final CrudProductUseCase productsUseCase;

  ProductsViewModelBase({
    required this.productsUseCase,
  });

  @observable
  List<ProductEntity> products = [];

  @action
  Future<void> getProducts(
    bool forceRefresh,
  ) async {
    final wrapper = await productsUseCase.fetch(forceRefresh);
    wrapper.fold(
      (failure) {
        products = [];
        Logger.log(failure);
      },
      (data) {
        products = data;
      },
    );
  }
}

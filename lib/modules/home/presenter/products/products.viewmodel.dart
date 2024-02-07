import 'package:how_much/core/logger.dart';
import 'package:how_much/modules/home/domain/entities/product.entity.dart';
import 'package:how_much/modules/home/domain/usecase/crud.product.dart';
import 'package:mobx/mobx.dart';

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

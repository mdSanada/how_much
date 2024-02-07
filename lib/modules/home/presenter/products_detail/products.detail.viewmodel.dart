import 'package:mobx/mobx.dart';

import '../../../../core/logger.dart';
import '../../domain/entities/product.entity.dart';
import '../../domain/usecase/crud.product.dart';

part 'products.detail.viewmodel.g.dart';

class ProductsDetailViewModel = ProductsDetailViewModelBase
    with _$ProductsDetailViewModel;

abstract class ProductsDetailViewModelBase with Store {
  @observable
  ProductEntity? product;

  final CrudProductUseCase productsUseCase;

  ProductsDetailViewModelBase({
    required this.productsUseCase,
  });

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
    return product;
  }

  Future<bool> deleteProduct(String id) async {
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
}

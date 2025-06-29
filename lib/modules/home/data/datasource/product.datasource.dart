import 'package:how_much/core/logger.dart';

import '../../../../network/protocol/product.database.protocol.dart';
import '../../../../user/current.user.dart';
import '../models/product.model.dart';

abstract class ProductDataSourceProtocol {
  Future<List<ProductModel>> fetchProducts(
    bool forceRefresh,
  );
  Future<ProductModel> readProduct(String id);
  Future<bool> deleteProduct(String id);
  Future<void> saveProduct(ProductModel product);
  Future<ProductModel> editProduct(ProductModel product);
}

class ProductDataSource implements ProductDataSourceProtocol {
  final ProductsDatabaseProtocol database;

  ProductDataSource({required this.database});

  @override
  Future<ProductModel> readProduct(String id) {
    final userId = CurrentUser().user!.id;
    return database.getProduct(
      userId,
      id,
    );
  }

  @override
  Future<List<ProductModel>> fetchProducts(
    bool forceRefresh,
  ) async {
    final userId = CurrentUser().user!.id;
    final products = await database.getProducts(
      userId,
      forceRefresh: forceRefresh,
    );
    return products;
  }

  @override
  Future<bool> deleteProduct(String id) async {
    final userId = CurrentUser().user!.id;
    await database.deleteProduct(
      userId,
      id,
    );
    return true;
  }

  @override
  Future<void> saveProduct(ProductModel product) async {
    Logger.log(product.toJson());
    final userId = CurrentUser().user!.id;
    await database.createProduct(userId, product.toJson());
  }

  @override
  Future<ProductModel> editProduct(ProductModel product) async {
    final userId = CurrentUser().user!.id;
    await database.updateProduct(
      userId,
      product.id,
      product.toJson(),
      forceRefresh: true,
    );
    return product;
  }
}

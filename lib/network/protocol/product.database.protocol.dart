import '../../modules/home/data/models/product.model.dart';

abstract class ProductsDatabaseProtocol {
  Future<void> createProduct(
    String userId,
    Map<String, dynamic> materialData,
  );

  Future<void> updateProduct(
    String userId,
    String productId,
    Map<String, dynamic> updatedData, {
    bool forceRefresh = true,
  });

  Future<void> deleteProduct(
    String userId,
    String productId,
  );

  Future<List<ProductModel>> getProducts(
    String userId, {
    bool forceRefresh = false,
  });

  Future<ProductModel> getProduct(
    String userId,
    String productId,
  );
}

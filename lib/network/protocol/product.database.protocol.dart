import '../../modules/home/data/models/product.model.dart';

abstract class ProductsDatabaseProtocol {
  Future<void> createProduct(
    String userId,
    Map<String, dynamic> materialData,
  );

  Future<void> updateProduct(
    String userId,
    String materialId,
    Map<String, dynamic> updatedData, {
    bool forceRefresh = true,
  });

  Future<void> deleteProduct(
    String userId,
    String materialId,
  );

  Future<List<ProductModel>> getProducts(
    String userId, {
    bool forceRefresh = false,
  });
}

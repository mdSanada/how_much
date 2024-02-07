import '../../modules/home/data/models/product.model.dart';
import '../collections.dart';
import '../protocol/product.database.protocol.dart';
import 'user.network.database.dart';

class ProductsFirestoreDatabase implements ProductsDatabaseProtocol {
  final UserNetworkDatabase _userNetworkDatabase;

  ProductsFirestoreDatabase({required UserNetworkDatabase userNetworkDatabase})
      : _userNetworkDatabase = userNetworkDatabase;

  @override
  Future<void> createProduct(
    String userId,
    Map<String, dynamic> productData,
  ) async {
    final doc = await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.products)
        .add(productData);

    await updateProduct(
      userId,
      doc.id,
      Map.of(
        {'id': doc.id},
      ),
      forceRefresh: false,
    );

    await getProducts(userId, forceRefresh: true);

    return;
  }

  @override
  Future<void> updateProduct(
    String userId,
    String productId,
    Map<String, dynamic> updatedData, {
    bool forceRefresh = true,
  }) async {
    await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.products)
        .doc(productId)
        .update(updatedData);

    if (forceRefresh) {
      await getProducts(userId, forceRefresh: true);
    }
  }

  @override
  Future<void> deleteProduct(
    String userId,
    String productId,
  ) {
    return _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.products)
        .doc(productId)
        .delete();
  }

  @override
  Future<List<ProductModel>> getProducts(
    String userId, {
    bool forceRefresh = true,
  }) async {
    // TODO: - Implement cache
    return await getRemoteProducts(userId);
  }

  Future<List<ProductModel>> getRemoteProducts(
    String userId,
  ) async {
    final snapshots = await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.products)
        .get();

    return snapshots.docs.map(
      (doc) {
        Map<String, dynamic> data = doc.data();
        return ProductModel.fromJson(data);
      },
    ).toList();
  }
}

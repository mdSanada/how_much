import '../../core/logger.dart';
import '../../modules/home/data/models/product.model.dart';
import '../cache/products.cache.databse.dart';
import '../collections.dart';
import '../protocol/product.database.protocol.dart';
import 'user.network.database.dart';

class ProductsFirestoreDatabase implements ProductsDatabaseProtocol {
  final UserNetworkDatabase _userNetworkDatabase;
  final ProductsCacheProtocol _productsCache = ProductsCacheDatabase();

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
  ) async {
    await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.products)
        .doc(productId)
        .delete();
    await getProducts(userId, forceRefresh: true);
    return;
  }

  @override
  Future<List<ProductModel>> getProducts(
    String userId, {
    bool forceRefresh = true,
  }) async {
    if (!forceRefresh) {
      try {
        final cached = await _productsCache.cache();
        if (cached.isNotEmpty) {
          return cached;
        }
      } catch (e) {
        Logger.log(e);
      }
    }
    final products = await getRemoteProducts(userId);
    await _productsCache.store(products);

    return products;
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

  @override
  Future<ProductModel> getProduct(
    String userId,
    String productId,
  ) async {
    final snapshots = await _userNetworkDatabase
        .getUserCollection(userId)
        .collection(Collections.products)
        .doc(productId)
        .get();
    Map<String, dynamic>? data = snapshots.data();
    if (data != null) {
      return ProductModel.fromJson(data);
    } else {
      throw Exception("Product not found");
    }
  }

  @override
  Future<void> clearCache() {
    return _productsCache.clear();
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/logger.dart';
import '../../modules/home/data/models/product.model.dart';

abstract class ProductsCacheProtocol {
  Future<bool> store(List<ProductModel> products);
  Future<List<ProductModel>> cache();
  Future<bool> clear();
}

class ProductsCacheDatabase implements ProductsCacheProtocol {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();
  final key = "PRODUCTS_CACHE";

  @override
  Future<bool> store(List<ProductModel> products) async {
    final SharedPreferences storage = await _storage;

    var body = json.encode(
      products
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    );

    try {
      await storage.setString(key, body);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<List<ProductModel>> cache() async {
    final SharedPreferences storage = await _storage;

    String body = "[]";
    List<ProductModel> products = [];
    try {
      body = storage.getString(key) ?? "[]";
    } catch (e) {
      body = "[]";
    }

    if (body != "[]") {
      var object = await jsonDecode(body);

      if (object != null) {
        try {
          final list = object
              .map(
                (i) => ProductModel.fromJson(i),
              )
              .toList();
          products = List<ProductModel>.from(list).toList();
        } catch (e) {
          return Future.value([]);
        }
      }
    }
    Logger.log(
      name: "CACHE",
      "$products",
    );
    return Future.value(products);
  }

  @override
  Future<bool> clear() {
    return _storage.then((storage) => storage.remove(key));
  }
}

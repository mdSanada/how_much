// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsViewModel on ProductsViewModelBase, Store {
  late final _$productsAtom =
      Atom(name: 'ProductsViewModelBase.products', context: context);

  @override
  List<ProductEntity> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductEntity> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$getProductsAsyncAction =
      AsyncAction('ProductsViewModelBase.getProducts', context: context);

  @override
  Future<void> getProducts(bool forceRefresh) {
    return _$getProductsAsyncAction.run(() => super.getProducts(forceRefresh));
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}

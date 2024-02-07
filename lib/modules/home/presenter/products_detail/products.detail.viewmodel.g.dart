// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.detail.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsDetailViewModel on ProductsDetailViewModelBase, Store {
  late final _$productAtom =
      Atom(name: 'ProductsDetailViewModelBase.product', context: context);

  @override
  ProductEntity? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductEntity? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$getProductAsyncAction =
      AsyncAction('ProductsDetailViewModelBase.getProduct', context: context);

  @override
  Future<ProductEntity?> getProduct(String id) {
    return _$getProductAsyncAction.run(() => super.getProduct(id));
  }

  @override
  String toString() {
    return '''
product: ${product}
    ''';
  }
}

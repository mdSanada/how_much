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

  late final _$configureProductAsyncAction = AsyncAction(
      'ProductsDetailViewModelBase.configureProduct',
      context: context);

  @override
  Future<void> configureProduct(ProductEntity product) {
    return _$configureProductAsyncAction
        .run(() => super.configureProduct(product));
  }

  late final _$getProductAsyncAction =
      AsyncAction('ProductsDetailViewModelBase.getProduct', context: context);

  @override
  Future<ProductEntity?> getProduct(String id) {
    return _$getProductAsyncAction.run(() => super.getProduct(id));
  }

  late final _$ProductsDetailViewModelBaseActionController =
      ActionController(name: 'ProductsDetailViewModelBase', context: context);

  @override
  String getUnitValue() {
    final _$actionInfo = _$ProductsDetailViewModelBaseActionController
        .startAction(name: 'ProductsDetailViewModelBase.getUnitValue');
    try {
      return super.getUnitValue();
    } finally {
      _$ProductsDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getUnitPercentage() {
    final _$actionInfo = _$ProductsDetailViewModelBaseActionController
        .startAction(name: 'ProductsDetailViewModelBase.getUnitPercentage');
    try {
      return super.getUnitPercentage();
    } finally {
      _$ProductsDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<KeyValue> getTotalSection() {
    final _$actionInfo = _$ProductsDetailViewModelBaseActionController
        .startAction(name: 'ProductsDetailViewModelBase.getTotalSection');
    try {
      return super.getTotalSection();
    } finally {
      _$ProductsDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<KeyValue> getUnitSection() {
    final _$actionInfo = _$ProductsDetailViewModelBaseActionController
        .startAction(name: 'ProductsDetailViewModelBase.getUnitSection');
    try {
      return super.getUnitSection();
    } finally {
      _$ProductsDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<KeyValue> getMaterialsSection() {
    final _$actionInfo = _$ProductsDetailViewModelBaseActionController
        .startAction(name: 'ProductsDetailViewModelBase.getMaterialsSection');
    try {
      return super.getMaterialsSection();
    } finally {
      _$ProductsDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product}
    ''';
  }
}

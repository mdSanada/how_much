// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add.products.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddProductsViewModel on AddProductsViewModelBase, Store {
  late final _$descriptionAtom =
      Atom(name: 'AddProductsViewModelBase.description', context: context);

  @override
  ProductDescriptionEntity? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(ProductDescriptionEntity? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$materialAtom =
      Atom(name: 'AddProductsViewModelBase.material', context: context);

  @override
  List<ProductMaterialEntity> get material {
    _$materialAtom.reportRead();
    return super.material;
  }

  @override
  set material(List<ProductMaterialEntity> value) {
    _$materialAtom.reportWrite(value, super.material, () {
      super.material = value;
    });
  }

  late final _$profitAtom =
      Atom(name: 'AddProductsViewModelBase.profit', context: context);

  @override
  ProductProfitEntity? get profit {
    _$profitAtom.reportRead();
    return super.profit;
  }

  @override
  set profit(ProductProfitEntity? value) {
    _$profitAtom.reportWrite(value, super.profit, () {
      super.profit = value;
    });
  }

  late final _$AddProductsViewModelBaseActionController =
      ActionController(name: 'AddProductsViewModelBase', context: context);

  @override
  dynamic configure() {
    final _$actionInfo = _$AddProductsViewModelBaseActionController.startAction(
        name: 'AddProductsViewModelBase.configure');
    try {
      return super.configure();
    } finally {
      _$AddProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(ProductDescriptionEntity description) {
    final _$actionInfo = _$AddProductsViewModelBaseActionController.startAction(
        name: 'AddProductsViewModelBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$AddProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaterial(List<ProductMaterialEntity> material) {
    final _$actionInfo = _$AddProductsViewModelBaseActionController.startAction(
        name: 'AddProductsViewModelBase.setMaterial');
    try {
      return super.setMaterial(material);
    } finally {
      _$AddProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfit(ProductProfitEntity profit) {
    final _$actionInfo = _$AddProductsViewModelBaseActionController.startAction(
        name: 'AddProductsViewModelBase.setProfit');
    try {
      return super.setProfit(profit);
    } finally {
      _$AddProductsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
material: ${material},
profit: ${profit}
    ''';
  }
}

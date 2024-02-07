// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add.product.profit.page.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddProductProfitViewModel on AddProductProfitViewModelBase, Store {
  late final _$profitTypeAtom =
      Atom(name: 'AddProductProfitViewModelBase.profitType', context: context);

  @override
  ProfitType get profitType {
    _$profitTypeAtom.reportRead();
    return super.profitType;
  }

  @override
  set profitType(ProfitType value) {
    _$profitTypeAtom.reportWrite(value, super.profitType, () {
      super.profitType = value;
    });
  }

  late final _$valueAtom =
      Atom(name: 'AddProductProfitViewModelBase.value', context: context);

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$actualCostAtom =
      Atom(name: 'AddProductProfitViewModelBase.actualCost', context: context);

  @override
  double get actualCost {
    _$actualCostAtom.reportRead();
    return super.actualCost;
  }

  @override
  set actualCost(double value) {
    _$actualCostAtom.reportWrite(value, super.actualCost, () {
      super.actualCost = value;
    });
  }

  late final _$actualPriceAtom =
      Atom(name: 'AddProductProfitViewModelBase.actualPrice', context: context);

  @override
  double get actualPrice {
    _$actualPriceAtom.reportRead();
    return super.actualPrice;
  }

  @override
  set actualPrice(double value) {
    _$actualPriceAtom.reportWrite(value, super.actualPrice, () {
      super.actualPrice = value;
    });
  }

  late final _$actualProfitAtom = Atom(
      name: 'AddProductProfitViewModelBase.actualProfit', context: context);

  @override
  double get actualProfit {
    _$actualProfitAtom.reportRead();
    return super.actualProfit;
  }

  @override
  set actualProfit(double value) {
    _$actualProfitAtom.reportWrite(value, super.actualProfit, () {
      super.actualProfit = value;
    });
  }

  late final _$AddProductProfitViewModelBaseActionController =
      ActionController(name: 'AddProductProfitViewModelBase', context: context);

  @override
  dynamic configure(AddProductsViewModel controller) {
    final _$actionInfo = _$AddProductProfitViewModelBaseActionController
        .startAction(name: 'AddProductProfitViewModelBase.configure');
    try {
      return super.configure(controller);
    } finally {
      _$AddProductProfitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfitType(ProfitType profit) {
    final _$actionInfo = _$AddProductProfitViewModelBaseActionController
        .startAction(name: 'AddProductProfitViewModelBase.setProfitType');
    try {
      return super.setProfitType(profit);
    } finally {
      _$AddProductProfitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(double value) {
    final _$actionInfo = _$AddProductProfitViewModelBaseActionController
        .startAction(name: 'AddProductProfitViewModelBase.setValue');
    try {
      return super.setValue(value);
    } finally {
      _$AddProductProfitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calculate() {
    final _$actionInfo = _$AddProductProfitViewModelBaseActionController
        .startAction(name: 'AddProductProfitViewModelBase.calculate');
    try {
      return super.calculate();
    } finally {
      _$AddProductProfitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update() {
    final _$actionInfo = _$AddProductProfitViewModelBaseActionController
        .startAction(name: 'AddProductProfitViewModelBase.update');
    try {
      return super.update();
    } finally {
      _$AddProductProfitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profitType: ${profitType},
value: ${value},
actualCost: ${actualCost},
actualPrice: ${actualPrice},
actualProfit: ${actualProfit}
    ''';
  }
}

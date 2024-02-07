// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add.product.description.page.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddProductDescriptionViewModel
    on AddProductDescriptionViewModelBase, Store {
  late final _$nameAtom =
      Atom(name: 'AddProductDescriptionViewModelBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom = Atom(
      name: 'AddProductDescriptionViewModelBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$quantityAtom = Atom(
      name: 'AddProductDescriptionViewModelBase.quantity', context: context);

  @override
  double get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(double value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$AddProductDescriptionViewModelBaseActionController =
      ActionController(
          name: 'AddProductDescriptionViewModelBase', context: context);

  @override
  dynamic configure(AddProductsViewModel controller) {
    final _$actionInfo = _$AddProductDescriptionViewModelBaseActionController
        .startAction(name: 'AddProductDescriptionViewModelBase.configure');
    try {
      return super.configure(controller);
    } finally {
      _$AddProductDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$AddProductDescriptionViewModelBaseActionController
        .startAction(name: 'AddProductDescriptionViewModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$AddProductDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$AddProductDescriptionViewModelBaseActionController
        .startAction(name: 'AddProductDescriptionViewModelBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$AddProductDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(double value) {
    final _$actionInfo = _$AddProductDescriptionViewModelBaseActionController
        .startAction(name: 'AddProductDescriptionViewModelBase.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$AddProductDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void update() {
    final _$actionInfo = _$AddProductDescriptionViewModelBaseActionController
        .startAction(name: 'AddProductDescriptionViewModelBase.update');
    try {
      return super.update();
    } finally {
      _$AddProductDescriptionViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
quantity: ${quantity}
    ''';
  }
}

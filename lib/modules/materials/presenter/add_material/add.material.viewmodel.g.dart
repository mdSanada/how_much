// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add.material.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddMaterialViewModel on AddMaterialViewModelBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'AddMaterialViewModelBase.isFormValid'))
          .value;
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??= Computed<String>(() => super.name,
          name: 'AddMaterialViewModelBase.name'))
      .value;
  Computed<String>? _$descriptionComputed;

  @override
  String get description =>
      (_$descriptionComputed ??= Computed<String>(() => super.description,
              name: 'AddMaterialViewModelBase.description'))
          .value;
  Computed<String>? _$priceComputed;

  @override
  String get price => (_$priceComputed ??= Computed<String>(() => super.price,
          name: 'AddMaterialViewModelBase.price'))
      .value;
  Computed<String>? _$quantityComputed;

  @override
  String get quantity =>
      (_$quantityComputed ??= Computed<String>(() => super.quantity,
              name: 'AddMaterialViewModelBase.quantity'))
          .value;
  Computed<Measures>? _$measureComputed;

  @override
  Measures get measure =>
      (_$measureComputed ??= Computed<Measures>(() => super.measure,
              name: 'AddMaterialViewModelBase.measure'))
          .value;

  late final _$onErrorAtom =
      Atom(name: 'AddMaterialViewModelBase.onError', context: context);

  @override
  bool get onError {
    _$onErrorAtom.reportRead();
    return super.onError;
  }

  @override
  set onError(bool value) {
    _$onErrorAtom.reportWrite(value, super.onError, () {
      super.onError = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AddMaterialViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isEditingAtom =
      Atom(name: 'AddMaterialViewModelBase.isEditing', context: context);

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$_materialAtom =
      Atom(name: 'AddMaterialViewModelBase._material', context: context);

  @override
  MaterialEntity get _material {
    _$_materialAtom.reportRead();
    return super._material;
  }

  @override
  set _material(MaterialEntity value) {
    _$_materialAtom.reportWrite(value, super._material, () {
      super._material = value;
    });
  }

  late final _$measuresAtom =
      Atom(name: 'AddMaterialViewModelBase.measures', context: context);

  @override
  List<Measures> get measures {
    _$measuresAtom.reportRead();
    return super.measures;
  }

  @override
  set measures(List<Measures> value) {
    _$measuresAtom.reportWrite(value, super.measures, () {
      super.measures = value;
    });
  }

  late final _$addMaterialAsyncAction =
      AsyncAction('AddMaterialViewModelBase.addMaterial', context: context);

  @override
  Future<void> addMaterial(BuildContext context) {
    return _$addMaterialAsyncAction.run(() => super.addMaterial(context));
  }

  late final _$AddMaterialViewModelBaseActionController =
      ActionController(name: 'AddMaterialViewModelBase', context: context);

  @override
  dynamic configure(MaterialEntity? material) {
    final _$actionInfo = _$AddMaterialViewModelBaseActionController.startAction(
        name: 'AddMaterialViewModelBase.configure');
    try {
      return super.configure(material);
    } finally {
      _$AddMaterialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onError: ${onError},
isLoading: ${isLoading},
isEditing: ${isEditing},
measures: ${measures},
isFormValid: ${isFormValid},
name: ${name},
description: ${description},
price: ${price},
quantity: ${quantity},
measure: ${measure}
    ''';
  }
}

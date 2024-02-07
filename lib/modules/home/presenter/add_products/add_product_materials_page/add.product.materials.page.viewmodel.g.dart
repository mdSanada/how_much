// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add.product.materials.page.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddProductMaterialsViewModel
    on AddProductMaterialsViewModelBase, Store {
  late final _$materialsAtom = Atom(
      name: 'AddProductMaterialsViewModelBase.materials', context: context);

  @override
  List<ProductMaterialEntity> get materials {
    _$materialsAtom.reportRead();
    return super.materials;
  }

  @override
  set materials(List<ProductMaterialEntity> value) {
    _$materialsAtom.reportWrite(value, super.materials, () {
      super.materials = value;
    });
  }

  late final _$AddProductMaterialsViewModelBaseActionController =
      ActionController(
          name: 'AddProductMaterialsViewModelBase', context: context);

  @override
  dynamic configure(AddProductsViewModel controller) {
    final _$actionInfo = _$AddProductMaterialsViewModelBaseActionController
        .startAction(name: 'AddProductMaterialsViewModelBase.configure');
    try {
      return super.configure(controller);
    } finally {
      _$AddProductMaterialsViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addMaterial(
      MaterialEntity material, Measures measures, double quantity, int? index) {
    final _$actionInfo = _$AddProductMaterialsViewModelBaseActionController
        .startAction(name: 'AddProductMaterialsViewModelBase.addMaterial');
    try {
      return super.addMaterial(material, measures, quantity, index);
    } finally {
      _$AddProductMaterialsViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void removeMaterial(int index) {
    final _$actionInfo = _$AddProductMaterialsViewModelBaseActionController
        .startAction(name: 'AddProductMaterialsViewModelBase.removeMaterial');
    try {
      return super.removeMaterial(index);
    } finally {
      _$AddProductMaterialsViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void update() {
    final _$actionInfo = _$AddProductMaterialsViewModelBaseActionController
        .startAction(name: 'AddProductMaterialsViewModelBase.update');
    try {
      return super.update();
    } finally {
      _$AddProductMaterialsViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
materials: ${materials}
    ''';
  }
}

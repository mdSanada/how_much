// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materials.detail.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MaterialsDetailViewModel on MaterialsDetailViewModelBase, Store {
  late final _$materialAtom =
      Atom(name: 'MaterialsDetailViewModelBase.material', context: context);

  @override
  MaterialEntity? get material {
    _$materialAtom.reportRead();
    return super.material;
  }

  @override
  set material(MaterialEntity? value) {
    _$materialAtom.reportWrite(value, super.material, () {
      super.material = value;
    });
  }

  late final _$getMaterialAsyncAction =
      AsyncAction('MaterialsDetailViewModelBase.getMaterial', context: context);

  @override
  Future<MaterialEntity?> getMaterial(String id) {
    return _$getMaterialAsyncAction.run(() => super.getMaterial(id));
  }

  late final _$MaterialsDetailViewModelBaseActionController =
      ActionController(name: 'MaterialsDetailViewModelBase', context: context);

  @override
  void configureMaterial(MaterialEntity material) {
    final _$actionInfo = _$MaterialsDetailViewModelBaseActionController
        .startAction(name: 'MaterialsDetailViewModelBase.configureMaterial');
    try {
      return super.configureMaterial(material);
    } finally {
      _$MaterialsDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
material: ${material}
    ''';
  }
}

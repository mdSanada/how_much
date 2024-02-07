// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select.material.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectMaterialsViewModel on SelectMaterialsViewModelBase, Store {
  late final _$materialsAtom =
      Atom(name: 'SelectMaterialsViewModelBase.materials', context: context);

  @override
  List<MaterialEntity> get materials {
    _$materialsAtom.reportRead();
    return super.materials;
  }

  @override
  set materials(List<MaterialEntity> value) {
    _$materialsAtom.reportWrite(value, super.materials, () {
      super.materials = value;
    });
  }

  late final _$getMaterialsAsyncAction = AsyncAction(
      'SelectMaterialsViewModelBase.getMaterials',
      context: context);

  @override
  Future<void> getMaterials(bool forceRefresh) {
    return _$getMaterialsAsyncAction
        .run(() => super.getMaterials(forceRefresh));
  }

  @override
  String toString() {
    return '''
materials: ${materials}
    ''';
  }
}

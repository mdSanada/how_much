import 'package:flutter/material.dart';
import 'package:how_much/calculator/calculator.dart';
import 'package:mobx/mobx.dart';

import '../../../../formatters/currency.formatter.dart';
import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';

part 'add.material.viewmodel.g.dart';

class AddMaterialViewModel = AddMaterialViewModelBase
    with _$AddMaterialViewModel;

abstract class AddMaterialViewModelBase with Store {
  final MaterialsUseCase materialsUseCase;
  final formatter = CurrencyFormatter.formatter();

  AddMaterialViewModelBase({
    required this.materialsUseCase,
  });

  @observable
  bool onError = false;

  @observable
  bool isLoading = false;

  @observable
  bool isEditing = false;

  @computed
  bool get isFormValid => _material.validate();

  @observable
  MaterialEntity _material = MaterialEntity.empty();

  @computed
  String get name => _material.name;

  @computed
  String get description => _material.description;

  @computed
  String get price =>
      (_material.price > 0) ? formatter.formatDouble(_material.price) : '';

  @computed
  String get quantity =>
      (_material.quantity > 0) ? _material.quantity.toString() : '';

  @computed
  Measures get measure => _material.measure;

  @observable
  List<Measures> measures = [];

  @action
  configure(MaterialEntity? material) {
    measures = getMeasures();
    if (material == null) {
      isEditing = false;
      return;
    }
    isEditing = true;
    _material = material;
  }

  List<Measures> getMeasures() {
    return MeasuresManager.getAllMeasures();
  }

  void updateMaterial({
    String? name,
    double? price,
    String? description,
    double? quantity,
    Measures? measure,
  }) {
    _material = _material.copy(
      name: name,
      price: price,
      description: description,
      quantity: quantity,
      measure: measure,
    );
  }

  @action
  Future<void> addMaterial(BuildContext context) async {
    isLoading = true;
    final isValid = _material.validate();
    if (!isValid) {
      isLoading = false;
      onError = true;
    }

    final wrapper = await materialsUseCase.save(_material);

    wrapper.fold(
      (l) {
        isLoading = false;
        onError = true;
      },
      (r) {
        isLoading = false;
        Navigator.pop(context);
      },
    );
  }
}

import 'package:how_much/core/logger.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';

part 'select.material.viewmodel.g.dart';

class SelectMaterialsViewModel = SelectMaterialsViewModelBase
    with _$SelectMaterialsViewModel;

abstract class SelectMaterialsViewModelBase with Store {
  final MaterialsUseCase materialsUseCase;

  SelectMaterialsViewModelBase({
    required this.materialsUseCase,
  });

  @observable
  List<MaterialEntity> materials = [];

  @action
  Future<void> getMaterials(
    bool forceRefresh,
  ) async {
    final wrapper = await materialsUseCase.fetch(forceRefresh);
    wrapper.fold(
      (failure) {
        materials = [];
        Logger.log(failure);
      },
      (data) {
        materials = data;
      },
    );
  }
}

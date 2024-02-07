import 'package:how_much/core/logger.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';

part 'materials.viewmodel.g.dart';

class MaterialsViewModel = MaterialsViewModelBase with _$MaterialsViewModel;

abstract class MaterialsViewModelBase with Store {
  final MaterialsUseCase materialsUseCase;

  MaterialsViewModelBase({
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

import 'package:mobx/mobx.dart';

import '../../../../core/logger.dart';
import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';

part 'materials.detail.viewmodel.g.dart';

class MaterialsDetailViewModel = MaterialsDetailViewModelBase
    with _$MaterialsDetailViewModel;

abstract class MaterialsDetailViewModelBase with Store {
  final MaterialsUseCase materialsUseCase;

  MaterialsDetailViewModelBase({
    required this.materialsUseCase,
  });

  @action
  Future<MaterialEntity?> getMaterial(
    String id,
  ) async {
    final wrapper = await materialsUseCase.read(id);
    MaterialEntity? material;
    wrapper.fold(
      (failure) {
        material = null;
        Logger.log(failure);
      },
      (data) {
        material = data;
      },
    );
    return material;
  }

  Future<bool> deleteMaterial(String id) async {
    var didDelete = false;
    final wrapper = await materialsUseCase.delete(id);
    wrapper.fold(
      (failure) {
        Logger.log(failure);
      },
      (data) {
        Logger.log(data);
        didDelete = true;
      },
    );
    return didDelete;
  }
}

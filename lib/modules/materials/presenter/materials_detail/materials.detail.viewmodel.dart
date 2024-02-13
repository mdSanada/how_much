import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:how_much/calculator/calculator.dart';
import 'package:how_much/widgets/inset_grouped/key.value.model.dart';
import 'package:mobx/mobx.dart';

import '../../../../consts/strings.dart';
import '../../../../core/logger.dart';
import '../../../../formatters/currency.formatter.dart';
import '../../../../formatters/number.formatter.dart';
import '../../domain/entities/material.entity.dart';
import '../../domain/usecase/crud.material.dart';

part 'materials.detail.viewmodel.g.dart';

class MaterialsDetailViewModel = MaterialsDetailViewModelBase
    with _$MaterialsDetailViewModel;

abstract class MaterialsDetailViewModelBase with Store {
  final MaterialsUseCase materialsUseCase;

  final CurrencyTextInputFormatter currencyFormatter =
      CurrencyFormatter.formatter();

  @observable
  MaterialEntity? material;

  MaterialsDetailViewModelBase({
    required this.materialsUseCase,
  });

  @action
  void configureMaterial(MaterialEntity material) {
    this.material = material;
  }

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
    this.material = material;
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

  List<KeyValue> section() {
    return [
      KeyValue(
        key: StringsConsts.formCost,
        value:
            CurrencyFormatter.number(material?.price ?? 0.0, currencyFormatter),
      ),
      KeyValue(
        key: StringsConsts.formQuantity,
        value: NumberFormatter.stringfy(material?.quantity ?? 0.0),
      ),
      KeyValue(
        key: StringsConsts.formMeasure,
        value: MeasuresManager.stringfy(material?.measure ?? Measures.unity),
      ),
    ];
  }
}

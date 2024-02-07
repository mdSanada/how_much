import 'package:flutter/material.dart';
import 'package:how_much/calculator/calculator.dart';

import '../../../../consts/strings.dart';
import '../../../../design/padding.dart';
import '../../../../design/sizes.dart';
import '../../../../design/stylesheet.dart';
import '../../../../formatters/number.formatter.dart';
import '../../../../validator/validator.dart';
import '../../../../widgets/buttons/expanded.row.button.dart';
import '../../../../widgets/cells/product.display.material.container.dart';
import '../../../../widgets/forms/select.material.quantity.dart';
import '../../../../widgets/title.app.bar.dart';
import '../../domain/entities/material.entity.dart';

class SelectQuantityMaterialView extends StatefulWidget {
  final MaterialEntity materialEntity;
  final Measures measures;
  final int? index;
  final double initialQuantity;
  final Function(double, Measures, MaterialEntity, int?) onSelectedMaterial;

  const SelectQuantityMaterialView({
    super.key,
    required this.materialEntity,
    required this.onSelectedMaterial,
    required this.initialQuantity,
    required this.measures,
    this.index,
  });

  @override
  State<SelectQuantityMaterialView> createState() =>
      _SelectQuantityMaterialViewState();
}

class _SelectQuantityMaterialViewState
    extends State<SelectQuantityMaterialView> {
  bool _isButtonEnabled = true;
  double _quantity = 0;
  Measures _measures = Measures.unity;

  @override
  void initState() {
    _quantity = widget.initialQuantity;
    _measures = widget.measures;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        title: StringsConsts.titleSelectQuantityMaterial,
        titleSpacing: 0,
        backButtonEnabled: true,
        highlightColor: Stylesheet.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.large),
            child: ProductDisplayMaterialContainerCell(
              title: widget.materialEntity.name,
              description: widget.materialEntity.description,
              value: widget.materialEntity.quantity,
              measure: widget.materialEntity.measure,
              highlightColor: Stylesheet.secondaryColor,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: IgnorePointer(
                ignoring: false,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectMaterialQuantityForm(
                        quantity: NumberFormatter.stringfy(_quantity),
                        onQuantityChanged: (quantity) {
                          _quantity = quantity;
                          setState(() {
                            _isButtonEnabled =
                                Validator.validateQuantity(quantity);
                          });
                        },
                        measure: _measures,
                        measures: MeasuresManager.getMeasuresOfSameType(
                          widget.materialEntity.measure,
                        ),
                        onMeasureChanged: (measure) {
                          _measures = measure;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left:
                              PaddingConstants.large - PaddingConstants.medium,
                          right:
                              PaddingConstants.large - PaddingConstants.medium,
                        ),
                        child: ExpandedRowButton(
                          title: "Adicionar",
                          isEnabled: _isButtonEnabled,
                          onPressed: () async {
                            widget.onSelectedMaterial(
                              _quantity,
                              _measures,
                              widget.materialEntity,
                              widget.index,
                            );
                            Navigator.of(context).popUntil(
                              (route) => route.isFirst,
                            );
                          },
                          fadeIn: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../calculator/calculator.dart';
import '../../consts/strings.dart';
import '../../validator/validator.forms.dart';
import '../dropdown/units.dropdown.dart';
import 'title.text.form.field.dart';
import 'type.form.field.dart';

class SelectMaterialQuantityForm extends StatelessWidget {
  const SelectMaterialQuantityForm({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
    required this.measures,
    required this.measure,
    required this.onMeasureChanged,
  });

  final String? quantity;
  final List<Measures> measures;
  final Measures measure;
  final Function(Measures) onMeasureChanged;
  final Function(double) onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TitleTextFormField(
            title: StringsConsts.formQuantity,
            placeholder: StringsConsts.formQuantityPlaceholder,
            initialValue: quantity,
            validator: ValidatorForms.validateQuantity,
            type: TypeFormField.number,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
            ),
            onValueChanged: (value, type) {
              onQuantityChanged(value);
            },
          ),
        ),
        UnitsDropdown(
          list: measures,
          initialValue: measure,
          onSelected: (value) {
            onMeasureChanged(value);
          },
        ),
      ],
    );
  }
}

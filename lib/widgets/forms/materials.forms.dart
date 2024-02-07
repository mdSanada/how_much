import 'package:flutter/material.dart';

import '../../calculator/calculator.dart';
import '../../consts/strings.dart';
import '../../validator/validator.forms.dart';
import '../dropdown/units.dropdown.dart';
import 'title.text.form.field.dart';
import 'type.form.field.dart';

class MaterialFormsWidget extends StatefulWidget {
  final bool isUserInteractionEnabled;
  final String? name;
  final String? description;
  final String? cost;
  final String? quantity;
  final Measures? measure;
  final List<Measures> measures;
  final Function(String) onNameChanged;
  final Function(String) onDescriptionChanged;
  final Function(double) onCostChanged;
  final Function(double) onQuantityChanged;
  final Function(Measures) onMeasureChanged;

  const MaterialFormsWidget({
    super.key,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    required this.onCostChanged,
    required this.onQuantityChanged,
    required this.onMeasureChanged,
    required this.isUserInteractionEnabled,
    required this.measures,
    this.name,
    this.description,
    this.cost,
    this.quantity,
    this.measure,
  });

  @override
  State<MaterialFormsWidget> createState() => _MaterialFormsWidgetState();
}

class _MaterialFormsWidgetState extends State<MaterialFormsWidget> {
  @override
  Widget build(BuildContext context) {
    var isUserInteractionEnabled = widget.isUserInteractionEnabled;
    return Expanded(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: IgnorePointer(
          ignoring: !isUserInteractionEnabled,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextFormField(
                  title: StringsConsts.formName,
                  placeholder: StringsConsts.formNamePlaceholder,
                  initialValue: widget.name,
                  validator: ValidatorForms.validateName,
                  type: TypeFormField.text,
                  onValueChanged: (value, type) {
                    widget.onNameChanged(value);
                  },
                ),
                TitleTextFormField(
                  title: StringsConsts.formDescription,
                  placeholder: StringsConsts.formDescriptionPlaceholder,
                  initialValue: widget.description,
                  validator: ValidatorForms.validateDescription,
                  type: TypeFormField.text,
                  onValueChanged: (value, type) {
                    widget.onDescriptionChanged(value);
                  },
                ),
                TitleTextFormField(
                  title: StringsConsts.formCost,
                  placeholder: StringsConsts.formCostPlaceholder,
                  initialValue: widget.cost,
                  validator: ValidatorForms.validateCost,
                  type: TypeFormField.money,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onValueChanged: (value, type) {
                    widget.onCostChanged(value);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TitleTextFormField(
                        title: StringsConsts.formQuantity,
                        placeholder: StringsConsts.formQuantityPlaceholder,
                        initialValue: widget.quantity,
                        validator: ValidatorForms.validateQuantity,
                        hasInfo: true,
                        infoDescription: StringsConsts.formQuantityDescription,
                        type: TypeFormField.number,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onValueChanged: (value, type) {
                          widget.onQuantityChanged(value);
                        },
                      ),
                    ),
                    UnitsDropdown(
                      list: widget.measures,
                      initialValue: widget.measure,
                      onSelected: (value) {
                        widget.onMeasureChanged(value);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

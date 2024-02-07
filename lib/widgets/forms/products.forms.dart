import 'package:flutter/material.dart';

import '../../consts/strings.dart';
import '../../validator/validator.forms.dart';
import 'title.text.form.field.dart';
import 'type.form.field.dart';

class ProductsFormsWidget extends StatefulWidget {
  final bool isUserInteractionEnabled;
  final String? name;
  final String? description;
  final String? quantity;

  final Function(String) onNameChanged;
  final Function(String) onDescriptionChanged;
  final Function(double) onQuantityChanged;

  const ProductsFormsWidget({
    super.key,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    required this.onQuantityChanged,
    required this.isUserInteractionEnabled,
    this.name,
    this.description,
    this.quantity,
  });

  @override
  State<ProductsFormsWidget> createState() => _MaterialFormsWidgetState();
}

class _MaterialFormsWidgetState extends State<ProductsFormsWidget> {
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
                  title: StringsConsts.formQuantity,
                  placeholder: StringsConsts.formQuantityPlaceholder,
                  initialValue: widget.quantity,
                  validator: ValidatorForms.validateQuantity,
                  type: TypeFormField.number,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onValueChanged: (value, type) {
                    widget.onQuantityChanged(value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

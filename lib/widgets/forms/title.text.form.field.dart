import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/padding.dart';
import '../../design/stylesheet.dart';
import '../../formatters/currency.formatter.dart';
import 'title.form.dart';
import 'type.form.field.dart';

class TitleTextFormField extends StatefulWidget {
  final String title;
  final String placeholder;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool hasInfo;
  final String infoDescription;
  final TypeFormField type;
  final void Function(dynamic, TypeFormField) onValueChanged;
  final EdgeInsets? padding;

  const TitleTextFormField({
    super.key,
    required this.title,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.controller,
    this.hasInfo = false,
    this.infoDescription = '',
    required this.type,
    required this.onValueChanged,
    this.initialValue,
    this.padding,
  });

  @override
  State<TitleTextFormField> createState() => _TitleTextFormFieldState();
}

class _TitleTextFormFieldState extends State<TitleTextFormField> {
  final _focus = FocusNode();
  bool _isDirty = false;
  final _formKey = GlobalKey<FormState>();
  late List<TextInputFormatter> _inputFormatters;

  @override
  void initState() {
    super.initState();
    _inputFormatters = [];
    switch (widget.type) {
      case TypeFormField.text:
        _inputFormatters = [];
      case TypeFormField.money:
        final formatter = CurrencyFormatter.formatter();
        _inputFormatters.add(formatter);
      case TypeFormField.number:
        _inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.only(
            top: PaddingConstants.sMedium,
            left: PaddingConstants.large,
            right: PaddingConstants.large,
            bottom: PaddingConstants.small,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleForm(
            hasInfo: widget.hasInfo,
            title: widget.title,
            description: widget.infoDescription,
          ),
          TextFormField(
            key: _formKey,
            style: Stylesheet.body(),
            initialValue: widget.initialValue,
            inputFormatters: _inputFormatters,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            focusNode: _focus,
            validator: _isDirty ? widget.validator : null,
            controller: widget.controller,
            onChanged: (value) {
              dynamic formattedValue = value;
              switch (widget.type) {
                case TypeFormField.text:
                  formattedValue = value;
                case TypeFormField.money:
                  final formatter = _inputFormatters.firstOrNull;
                  formattedValue = value;
                  if (formatter != null) {
                    final currencyFormatter =
                        formatter as CurrencyTextInputFormatter;
                    final double =
                        CurrencyFormatter.lastValue(currencyFormatter);
                    formattedValue = double;
                  }
                case TypeFormField.number:
                  formattedValue = double.tryParse(value) ?? 0.0;
              }
              widget.onValueChanged(formattedValue, widget.type);
              setState(() {
                _isDirty = true;
              });
            },
            onTapOutside: (event) => _formKey.currentState?.validate(),
            onFieldSubmitted: (term) {
              _focus.unfocus();
              _formKey.currentState?.validate();
            },
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              hintText: widget.placeholder,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_much/formatters/currency.formatter.dart';
import 'package:how_much/formatters/percentage.foramtter.dart';

import '../../consts/strings.dart';
import '../../modules/home/domain/entities/profit.type.dart';
import '../../validator/validator.forms.dart';
import 'title.text.form.field.dart';
import 'type.form.field.dart';

class ProfitValueForm extends StatelessWidget {
  const ProfitValueForm({
    super.key,
    required this.profit,
    required this.onProfitChanged,
    required this.type,
  });

  final double profit;
  final Function(double) onProfitChanged;
  final ProfitType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: type == ProfitType.percentage,
          child: Expanded(
            child: TitleTextFormField(
              title: StringsConsts.productTitleProfit,
              placeholder: StringsConsts.productTitleProfitPlaceholder,
              initialValue:
                  (profit > 0) ? PercentageFormatter.stringfy(profit) : null,
              validator: ValidatorForms.validateQuantity,
              type: TypeFormField.number,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onValueChanged: (value, type) {
                onProfitChanged(value);
              },
            ),
          ),
        ),
        Visibility(
          visible: type == ProfitType.value,
          child: Expanded(
            child: TitleTextFormField(
              title: 'Valor de venda (R\$)',
              placeholder: StringsConsts.formCostPlaceholder,
              initialValue: (profit > 0)
                  ? CurrencyFormatter.number(
                      profit,
                      CurrencyFormatter.formatter(),
                    )
                  : null,
              validator: ValidatorForms.validateCost,
              type: TypeFormField.money,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onValueChanged: (value, type) {
                onProfitChanged(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}

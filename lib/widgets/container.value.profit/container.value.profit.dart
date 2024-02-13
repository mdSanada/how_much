import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:how_much/consts/strings.dart';

import '../../design/sizes.dart';
import '../../design/stylesheet.dart';
import '../../formatters/currency.formatter.dart';

class ContainerProductValueProfit extends StatelessWidget {
  final String total;
  final String profit;

  ContainerProductValueProfit({
    super.key,
    required this.total,
    required this.profit,
  });

  final CurrencyTextInputFormatter currencyFormatter =
      CurrencyFormatter.formatter();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(Sizes.medium),
            decoration: BoxDecoration(
              color: Stylesheet.primaryColor,
              borderRadius: BorderRadius.circular(Sizes.small),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsConsts.pricePerUnit,
                        style: Stylesheet.caption(color: Stylesheet.white),
                      ),
                      Text(
                        total,
                        style: Stylesheet.header02(
                          color: Stylesheet.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(Sizes.small),
                  decoration: BoxDecoration(
                    color: Stylesheet.white,
                    borderRadius: BorderRadius.circular(Sizes.small),
                  ),
                  child: Text(
                    profit,
                    style: Stylesheet.body(color: Stylesheet.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

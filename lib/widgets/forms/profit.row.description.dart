import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:how_much/design/sizes.dart';

import '../../design/corner.radius.dart';
import '../../design/opacity.dart';
import '../../design/padding.dart';
import '../../design/stylesheet.dart';
import '../../formatters/currency.formatter.dart';
import '../../formatters/percentage.foramtter.dart';

class ProfitRowDescription extends StatelessWidget {
  final Color color;
  final String title;
  final double value;
  final bool hasProfit;
  final double? profit;
  final CurrencyTextInputFormatter _currencyFormatter =
      CurrencyFormatter.formatter();

  ProfitRowDescription({
    super.key,
    required this.color,
    required this.title,
    required this.value,
    this.hasProfit = false,
    this.profit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 90,
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: PaddingConstants.medium,
                left: PaddingConstants.large,
                right: PaddingConstants.large,
                bottom: PaddingConstants.small,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                  CornerRadius.medium,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(
                        PaddingConstants.small,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: Stylesheet.caption(
                              color: Stylesheet.white.withOpacity(
                                OpacityConstants.high,
                              ),
                            ),
                          ),
                          Text(
                            CurrencyFormatter.number(value, _currencyFormatter),
                            style: Stylesheet.header(
                              color: Stylesheet.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: Sizes.productCellContraint,
                    ),
                    child: Visibility(
                      visible: hasProfit,
                      child: Container(
                        margin: const EdgeInsets.all(
                          PaddingConstants.small,
                        ),
                        padding: const EdgeInsets.all(
                          PaddingConstants.small,
                        ),
                        decoration: BoxDecoration(
                          color: Stylesheet.backgroundColor
                              .withOpacity(OpacityConstants.half),
                          borderRadius: BorderRadius.circular(
                            CornerRadius.medium,
                          ),
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: Sizes.productCellContraint,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                PercentageFormatter.stringfy(profit ?? 0),
                                style: Stylesheet.subtitle(
                                  color: Stylesheet.white,
                                  fontWeight: FontWeight.w400,
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
            ),
          ),
        ),
      ],
    );
  }
}

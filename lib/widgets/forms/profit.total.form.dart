import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/stylesheet.dart';

class ProfitTotalForm extends StatelessWidget {
  const ProfitTotalForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: PaddingConstants.medium,
            left: PaddingConstants.large + PaddingConstants.small,
            right: PaddingConstants.large + PaddingConstants.small,
            bottom: PaddingConstants.small,
          ),
          child: Text(
            'RESUMO',
            style: Stylesheet.body(),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: PaddingConstants.large,
            right: PaddingConstants.large,
          ),
          decoration: BoxDecoration(
            color: Stylesheet.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(CornerRadius.medium),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingConstants.medium,
                      left: PaddingConstants.small,
                      right: PaddingConstants.small,
                    ),
                    child: Text(
                      'Rendimento',
                      style: Stylesheet.body(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingConstants.medium,
                      left: PaddingConstants.small,
                      right: PaddingConstants.small,
                    ),
                    child: Text(
                      'Custo total',
                      style: Stylesheet.body(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingConstants.medium,
                      left: PaddingConstants.small,
                      right: PaddingConstants.small,
                      bottom: PaddingConstants.medium,
                    ),
                    child: Text(
                      'Lucro total',
                      style: Stylesheet.body(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

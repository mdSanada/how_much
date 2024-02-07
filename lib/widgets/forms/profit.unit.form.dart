import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/stylesheet.dart';

class ProfitUnitForm extends StatelessWidget {
  const ProfitUnitForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
            'UNIDADE',
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: PaddingConstants.medium,
                      left: PaddingConstants.small,
                      right: PaddingConstants.small,
                    ),
                    child: Text(
                      'Custo por unidade',
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
                      'Lucro por unidade',
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

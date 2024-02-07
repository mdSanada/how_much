import 'package:flutter/material.dart';

import '../../calculator/calculator.dart';
import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/stylesheet.dart';
import '../../formatters/number.formatter.dart';

class ProductDisplayMaterialContainerCell extends StatelessWidget {
  final String title;
  final String description;
  final double value;
  final Measures measure;
  final Color highlightColor;

  const ProductDisplayMaterialContainerCell({
    super.key,
    required this.title,
    required this.description,
    required this.highlightColor,
    required this.value,
    required this.measure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(PaddingConstants.sMedium),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            CornerRadius.medium,
          ),
        ),
        color: Stylesheet.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Stylesheet.subtitle(),
                textAlign: TextAlign.start,
              ),
              Text(
                description,
                style: Stylesheet.body(),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: PaddingConstants.large),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      NumberFormatter.stringfy(
                        value,
                      ),
                      style: Stylesheet.subtitle(
                        color: highlightColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      MeasuresManager.stringfy(measure),
                      style: Stylesheet.body(
                        color: highlightColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

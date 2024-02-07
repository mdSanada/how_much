import 'package:flutter/material.dart';

import '../../calculator/calculator.dart';
import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/sizes.dart';
import '../../design/stylesheet.dart';
import '../../formatters/number.formatter.dart';
import '../buttons/floating.action.icon.button.dart';

class ProductDisplayMaterialCell extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final double value;
  final Measures measure;
  final Color highlightColor;
  final void Function(int) onPressed;
  final void Function(int) onDelete;

  const ProductDisplayMaterialCell({
    super.key,
    required this.title,
    required this.description,
    required this.highlightColor,
    required this.onPressed,
    required this.index,
    required this.value,
    required this.onDelete,
    required this.measure,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              CornerRadius.medium,
            ),
          ),
        ),
        backgroundColor: Stylesheet.white,
        foregroundColor: Stylesheet.black,
        padding: const EdgeInsets.all(PaddingConstants.sMedium),
      ),
      onPressed: () => onPressed(index),
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
                        color: Stylesheet.error,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      MeasuresManager.stringfy(measure),
                      style: Stylesheet.body(
                        color: Stylesheet.error,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              FloatingIconButton(
                color: Stylesheet.error,
                icon: Icons.delete,
                size: Sizes.tabbarIcon,
                onPressed: () => onDelete(index),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

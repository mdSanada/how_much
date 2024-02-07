import 'package:flutter/material.dart';

import '../design/padding.dart';
import '../design/sizes.dart';

class ContainerLine extends StatelessWidget {
  final double height;
  final double width;

  const ContainerLine({
    super.key,
    required this.highlightColor,
    this.height = Sizes.line,
    this.width = Sizes.button,
  });

  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: PaddingConstants.small),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height),
        color: highlightColor,
      ),
      height: height,
      width: width,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:how_much/design/corner.radius.dart';
import 'package:how_much/design/opacity.dart';
import 'package:how_much/design/padding.dart';
import 'package:how_much/design/stylesheet.dart';

import '../design/sizes.dart';

class Spacing extends StatelessWidget {
  final double size;
  final double line;
  final Color color;
  final double margin;
  final double spacing;

  const Spacing({
    super.key,
    this.size = Sizes.medium,
    this.line = 0,
    this.color = Stylesheet.black,
    this.margin = PaddingConstants.sMedium,
    this.spacing = PaddingConstants.small,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: spacing,
              left: margin,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(OpacityConstants.low),
              borderRadius: BorderRadius.circular(
                CornerRadius.medium,
              ),
            ),
            height: line,
          ),
        ],
      ),
    );
  }
}

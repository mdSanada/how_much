import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../design/sizes.dart';
import '../design/stylesheet.dart';

class BadgeSubscription extends StatelessWidget {
  final String badge;

  const BadgeSubscription({
    super.key,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: Sizes.small / 2,
          bottom: Sizes.small / 2,
          left: Sizes.small,
          right: Sizes.small),
      decoration: BoxDecoration(
        color: Stylesheet.white,
        borderRadius: BorderRadius.circular(Sizes.small),
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            colors: [Stylesheet.tertiaryColor, Stylesheet.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          width: Sizes.thinLine,
        ),
      ),
      child: Center(
        child: Text(
          badge,
          style: Stylesheet.caption(),
        ),
      ),
    );
  }
}

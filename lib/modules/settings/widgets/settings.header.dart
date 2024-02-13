import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design/sizes.dart';
import '../../../design/stylesheet.dart';
import '../../../widgets/badge.subscription.dart';
import '../../../widgets/spacing.dart';

class SettingsHeader extends StatelessWidget {
  final String letters;
  final String name;
  final String subscription;

  const SettingsHeader({
    super.key,
    required this.letters,
    required this.name,
    required this.subscription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Sizes.small),
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Stylesheet.primaryColor,
                Stylesheet.tertiaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(Sizes.large),
          ),
          child: Center(
            child: Text(
              letters,
              style: Stylesheet.header02(color: Stylesheet.white),
            ),
          ),
        ),
        const Spacing(
          size: Sizes.small,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Stylesheet.subtitle(),
            ),
            BadgeSubscription(
              badge: subscription,
            ),
          ],
        ),
      ],
    );
  }
}

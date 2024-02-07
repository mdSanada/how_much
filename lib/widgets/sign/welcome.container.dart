import 'package:flutter/material.dart';

import '../../consts/strings.dart';
import '../../design/opacity.dart';
import '../../design/padding.dart';
import '../../design/sizes.dart';
import '../../design/stylesheet.dart';
import '../container.line.dart';
import '../spacing.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingConstants.large,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ContainerLine(
              height: Sizes.largeLine,
              highlightColor: Stylesheet.primaryColor,
            ),
            const Spacing(size: PaddingConstants.small),
            Text(
              StringsConsts.welcome,
              style: Stylesheet.header(color: Stylesheet.white),
            ),
            const Spacing(size: PaddingConstants.small),
            Text(
              StringsConsts.welcomeDescription,
              style: Stylesheet.subtitle(
                  color: Stylesheet.backgroundColor
                      .withOpacity(OpacityConstants.high)),
            ),
          ],
        ),
      ),
    );
  }
}

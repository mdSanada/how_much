import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/strings.dart';
import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/sizes.dart';
import '../../design/stylesheet.dart';
import '../../images/images.dart';
import '../spacing.dart';
import 'platform.button.dart';

class SignSheet extends StatelessWidget {
  final bool googleIsLoading;
  final bool appleIsLoading;
  final bool fadeIn;
  final Function()? onTapGoogleSign;
  final Function()? onTapAppleSign;

  const SignSheet({
    super.key,
    required this.onTapGoogleSign,
    required this.onTapAppleSign,
    required this.googleIsLoading,
    required this.appleIsLoading,
    required this.fadeIn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Stylesheet.lightGray,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            CornerRadius.large,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          PaddingConstants.large,
        ),
        child: Column(
          children: [
            const Spacing(size: Sizes.footerBottomSheet),
            PlatformButton(
              image: Images.apple,
              title: StringsConsts.continueApple,
              isLoading: appleIsLoading,
              onPressed: onTapAppleSign,
              fadeIn: fadeIn,
              loadingColor: Stylesheet.primaryColor,
            ),
            PlatformButton(
              image: Images.google,
              title: StringsConsts.continueGoogle,
              isLoading: googleIsLoading,
              onPressed: onTapGoogleSign,
              fadeIn: fadeIn,
              loadingColor: Stylesheet.primaryColor,
            ),
            const Spacing(size: Sizes.footerBottomSheet),
          ],
        ),
      ),
    );
  }
}

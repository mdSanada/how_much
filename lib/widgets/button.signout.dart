import 'package:flutter/material.dart';
import 'package:how_much/consts/strings.dart';

import '../design/corner.radius.dart';
import '../design/opacity.dart';
import '../design/sizes.dart';
import '../design/stylesheet.dart';
import 'buttons/box.button.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BoxButton(
      title: StringsConsts.signout,
      textStyle: Stylesheet.body(color: Stylesheet.error),
      borderRadius: BorderRadius.circular(
        CornerRadius.medium,
      ),
      height: Sizes.button,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      backgroundColor: Stylesheet.error
          .withOpacity(OpacityConstants.superlow), //Colors.transparent,
      onPressed: onPressed,
    );
  }
}

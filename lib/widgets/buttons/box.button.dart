import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../design/corner.radius.dart';
import '../../design/stylesheet.dart';

class BoxButton extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final void Function()? onPressed;
  final String title;
  final TextStyle textStyle;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final LinearGradient? gradient;
  final BorderRadiusGeometry? borderRadius;
  final BorderRadius? buttonBorderRadius;

  const BoxButton({
    super.key,
    required this.title,
    required this.textStyle,
    this.borderRadius,
    this.height = 60,
    this.backgroundColor = Stylesheet.secondaryColor,
    this.onPressed,
    this.isLoading = false,
    this.padding,
    this.gradient,
    this.buttonBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(CornerRadius.large),
        gradient: gradient,
      ),
      clipBehavior: Clip.hardEdge,
      child: CupertinoButton(
        borderRadius: buttonBorderRadius,
        padding: padding,
        color: gradient != null ? null : backgroundColor,
        disabledColor: CupertinoColors.inactiveGray,
        onPressed: onPressed,
        child: isLoading
            ? const SpinKitDoubleBounce(color: Colors.white)
            : Text(
                title,
                style: textStyle,
              ),
      ),
    );
  }
}

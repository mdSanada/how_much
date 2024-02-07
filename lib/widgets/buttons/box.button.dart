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

  const BoxButton({
    super.key,
    required this.title,
    required this.textStyle,
    this.height = 60,
    this.backgroundColor = Stylesheet.secondaryColor,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CornerRadius.large),
      ),
      clipBehavior: Clip.hardEdge,
      child: CupertinoButton(
        color: backgroundColor,
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

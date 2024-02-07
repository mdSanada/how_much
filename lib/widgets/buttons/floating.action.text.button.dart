import 'package:flutter/material.dart';

import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/stylesheet.dart';

class FloatingActionTextButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color highlightColor;

  const FloatingActionTextButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.highlightColor,
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
        backgroundColor: Stylesheet.backgroundColor,
        foregroundColor: highlightColor,
        padding: const EdgeInsets.all(
          PaddingConstants.small,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}

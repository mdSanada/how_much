import 'package:flutter/material.dart';

import '../../design/padding.dart';
import '../../design/sizes.dart';
import '../../design/stylesheet.dart';

class FloatingIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double size;
  final void Function()? onPressed;

  const FloatingIconButton({
    super.key,
    required this.color,
    required this.icon,
    this.onPressed,
    this.size = Sizes.footerBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      icon: Container(
        margin: const EdgeInsets.all(
          PaddingConstants.small,
        ),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            size / 2,
          ),
        ),
        child: Icon(
          icon,
          color: Stylesheet.white,
        ),
      ),
    );
  }
}

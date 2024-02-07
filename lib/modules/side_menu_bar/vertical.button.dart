import 'package:flutter/material.dart';
import 'package:how_much/design/corner.radius.dart';
import 'package:how_much/design/sizes.dart';

import '../../../design/opacity.dart';
import '../../../design/stylesheet.dart';

class VerticalButton extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isSelected;
  final String title;
  final void Function()? onPressed;
  final Color highlightColor;

  const VerticalButton({
    super.key,
    required this.constraints,
    required this.isSelected,
    required this.title,
    required this.onPressed,
    this.highlightColor = Stylesheet.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RotatedBox(
            quarterTurns: 1,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: Sizes.minWidthSideButton,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? highlightColor : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(CornerRadius.large),
                    topLeft: Radius.circular(CornerRadius.large),
                  ),
                  border: Border(
                    left: BorderSide(
                      color: Stylesheet.black.withOpacity(OpacityConstants.low),
                      style: BorderStyle.solid,
                      width: isSelected ? Sizes.zero : Sizes.thinLine,
                    ),
                    top: BorderSide(
                      color: Stylesheet.black.withOpacity(OpacityConstants.low),
                      style: BorderStyle.solid,
                      width: isSelected ? Sizes.zero : Sizes.thinLine,
                    ),
                    right: BorderSide(
                      color: Stylesheet.black.withOpacity(OpacityConstants.low),
                      style: BorderStyle.solid,
                      width: isSelected ? Sizes.zero : Sizes.thinLine,
                    ),
                    bottom: BorderSide(
                      color: Stylesheet.black.withOpacity(OpacityConstants.low),
                      style: BorderStyle.solid,
                      width: isSelected ? Sizes.zero : Sizes.closeZero,
                    ),
                  ),
                ),
                width: constraints.maxHeight / 5,
                child: TextButton(
                  onPressed: isSelected ? null : onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledBackgroundColor:
                        isSelected ? highlightColor : Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(CornerRadius.large),
                      ),
                    ),
                  ),
                  child: Text(
                    title.toUpperCase(),
                    style: Stylesheet.button(
                      color: isSelected
                          ? Stylesheet.backgroundColor
                          : Stylesheet.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

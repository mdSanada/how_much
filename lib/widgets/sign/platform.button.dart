import 'package:flutter/cupertino.dart';
import 'package:how_much/design/stylesheet.dart';
import 'package:how_much/widgets/buttons/expanded.widget.button.dart';
import 'package:how_much/widgets/spacing.dart';

class PlatformButton extends StatefulWidget {
  final String title;
  final ImageProvider image;
  final Function()? onPressed;
  final bool isLoading;
  final Color loadingColor;
  final bool fadeIn;

  const PlatformButton({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
    required this.isLoading,
    required this.loadingColor,
    required this.fadeIn,
  });

  @override
  State<PlatformButton> createState() => _PlatformButtonState();
}

class _PlatformButtonState extends State<PlatformButton> {
  final double guidelineLeftPadding = 16;

  final double guidelineInnerPadding = 10;

  final double guidelineRightPadding = 12;

  final double guidelineIconSize = 20;

  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.isLoading;
    bool fadeIn = widget.fadeIn;
    Function()? onPressed = widget.onPressed;
    return ExpandedRowWidgetButton(
      backgroundColor: Stylesheet.white,
      isLoading: isLoading,
      onPressed: onPressed,
      fadeIn: fadeIn,
      loadingColor: widget.loadingColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacing(
            spacing: guidelineLeftPadding,
          ),
          SizedBox(
            height: guidelineIconSize,
            width: guidelineIconSize,
            child: Image(
              image: widget.image,
            ),
          ),
          Spacing(
            spacing: guidelineInnerPadding,
          ),
          Text(
            widget.title,
            style: Stylesheet.button(),
          ),
          Spacing(
            spacing: guidelineRightPadding,
          ),
        ],
      ),
    );
  }
}

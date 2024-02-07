import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../design/corner.radius.dart';
import '../../design/duration.dart';
import '../../design/stylesheet.dart';

class WidgetButton extends StatefulWidget {
  final double height;
  final Color backgroundColor;
  final Future<void> Function()? onPressed;
  final Widget child;
  final bool isLoading;
  final bool isEnabled;
  final bool disableButtonOnLoading;
  final bool fadeIn;
  final Color loadingColor;
  final double? width;

  const WidgetButton({
    super.key,
    required this.child,
    this.height = 60,
    this.backgroundColor = Stylesheet.secondaryColor,
    this.onPressed,
    this.isLoading = false,
    required this.isEnabled,
    this.disableButtonOnLoading = false,
    this.loadingColor = Stylesheet.white,
    this.width,
    required this.fadeIn,
  });

  @override
  State<WidgetButton> createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  bool _hideChild = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.isLoading;
    double width =
        widget.isLoading ? widget.height : widget.width ?? double.maxFinite;
    double corner =
        (widget.isLoading) ? (widget.height / 2) : CornerRadius.large;
    bool isEnabled = widget.isEnabled && !isLoading;
    Future<void> Function()? onPressed = widget.onPressed;
    bool fadeIn = widget.fadeIn;

    return Flexible(
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          width =
              isLoading ? widget.height : widget.width ?? constraints.maxWidth;
          return AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            height: widget.height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(corner),
            ),
            clipBehavior: Clip.hardEdge,
            duration: AnimationDuration.normal,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              color: widget.backgroundColor,
              disabledColor: (widget.disableButtonOnLoading)
                  ? CupertinoColors.inactiveGray
                  : !isLoading
                      ? CupertinoColors.inactiveGray
                      : widget.backgroundColor,
              onPressed: (!isEnabled)
                  ? null
                  : () async {
                      onPressed!();
                      setState(() {
                        _hideChild = (isLoading != widget.isLoading);

                        isLoading = widget.isLoading;

                        isEnabled = widget.isEnabled && !isLoading;

                        width = (widget.isLoading)
                            ? widget.height
                            : constraints.maxWidth;

                        corner = (widget.isLoading)
                            ? (widget.height / 2)
                            : CornerRadius.large;
                      });
                    },
              child: Visibility(
                  visible: !_hideChild,
                  child: isLoading
                      ? SpinKitDoubleBounce(color: widget.loadingColor)
                      : fadeIn
                          ? widget.child.animate().fadeIn(
                                delay: AnimationDuration.superfast,
                                duration: AnimationDuration.superfast,
                              )
                          : widget.child),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/stylesheet.dart';
import 'widget.button.dart';

class AnimatedBoxButton extends StatefulWidget {
  final double height;
  final Color backgroundColor;
  final Future<void> Function()? onPressed;
  final String title;
  final TextStyle textStyle;
  final bool isLoading;
  final bool isEnabled;
  final bool disableButtonOnLoading;
  final Color loadingColor;
  final bool fadeIn;

  const AnimatedBoxButton({
    super.key,
    required this.title,
    required this.textStyle,
    this.height = 60,
    this.backgroundColor = Stylesheet.secondaryColor,
    this.onPressed,
    this.isLoading = false,
    required this.isEnabled,
    this.disableButtonOnLoading = false,
    this.loadingColor = Stylesheet.white,
    required this.fadeIn,
  });

  @override
  State<AnimatedBoxButton> createState() => _AnimatedBoxButtonState();
}

class _AnimatedBoxButtonState extends State<AnimatedBoxButton> {
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
    return WidgetButton(
      height: widget.height,
      backgroundColor: widget.backgroundColor,
      onPressed: widget.onPressed,
      isLoading: widget.isLoading,
      isEnabled: widget.isEnabled,
      disableButtonOnLoading: widget.disableButtonOnLoading,
      loadingColor: widget.loadingColor,
      fadeIn: widget.fadeIn,
      child: Text(
        widget.title,
        style: widget.textStyle,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/padding.dart';
import '../../design/stylesheet.dart';
import 'animated.box.button.dart';

class ExpandedRowButton extends StatefulWidget {
  final String title;
  final Future<void> Function()? onPressed;
  final bool isEnabled;
  final bool isLoading;
  final bool disableButtonOnLoading;
  final bool fadeIn;

  const ExpandedRowButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.disableButtonOnLoading = false,
    required this.fadeIn,
  });

  @override
  State<ExpandedRowButton> createState() => _ExpandedRowButtonState();
}

class _ExpandedRowButtonState extends State<ExpandedRowButton> {
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
    bool isEnabled = widget.isEnabled;
    bool fadeIn = widget.fadeIn;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConstants.sMedium,
        horizontal: PaddingConstants.medium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBoxButton(
            title: widget.title,
            isLoading: isLoading,
            fadeIn: fadeIn,
            textStyle: Stylesheet.button(
              color: Stylesheet.white,
            ),
            isEnabled: isEnabled,
            disableButtonOnLoading: widget.disableButtonOnLoading,
            onPressed: () async {
              widget.onPressed!();
              setState(
                () {
                  isLoading = widget.isLoading;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

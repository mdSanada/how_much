import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/padding.dart';
import '../../design/stylesheet.dart';
import 'widget.button.dart';

class ExpandedRowWidgetButton extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;
  final bool isEnabled;
  final bool isLoading;
  final bool disableButtonOnLoading;
  final Color backgroundColor;
  final Color loadingColor;
  final bool fadeIn;

  const ExpandedRowWidgetButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.disableButtonOnLoading = false,
    this.backgroundColor = Stylesheet.secondaryColor,
    this.loadingColor = Stylesheet.white,
    required this.fadeIn,
  });

  @override
  State<ExpandedRowWidgetButton> createState() =>
      _ExpandedRowWidgetButtonState();
}

class _ExpandedRowWidgetButtonState extends State<ExpandedRowWidgetButton> {
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
    Function()? onPressed = widget.onPressed;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConstants.sMedium,
        horizontal: PaddingConstants.medium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetButton(
            backgroundColor: widget.backgroundColor,
            isLoading: isLoading,
            isEnabled: isEnabled,
            fadeIn: fadeIn,
            disableButtonOnLoading: widget.disableButtonOnLoading,
            loadingColor: widget.loadingColor,
            onPressed: (!isEnabled)
                ? null
                : () async {
                    onPressed!();
                    setState(
                      () {
                        isLoading = widget.isLoading;
                      },
                    );
                  },
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

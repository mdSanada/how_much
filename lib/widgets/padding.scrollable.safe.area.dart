import 'package:flutter/material.dart';

import '../design/padding.dart';

class PaddingScrollableSafeArea extends StatelessWidget {
  final Widget child;
  final double padding;

  const PaddingScrollableSafeArea({
    super.key,
    required this.child,
    this.padding = PaddingConstants.medium,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: padding,
          ),
          child: child,
        ),
      ),
    );
  }
}

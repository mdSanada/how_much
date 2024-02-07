import 'package:flutter/material.dart';

import '../design/padding.dart';

class PaddingSafeArea extends StatelessWidget {
  final Widget child;

  const PaddingSafeArea({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingConstants.medium,
        ),
        child: child,
      ),
    );
  }
}

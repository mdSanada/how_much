import 'package:flutter/material.dart';

import '../design/opacity.dart';
import '../design/sizes.dart';
import '../design/stylesheet.dart';

class VersionLabel extends StatelessWidget {
  final String version;

  const VersionLabel({
    super.key,
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.small),
      child: Text(
        version,
        style: Stylesheet.body(
          color: Stylesheet.black.withOpacity(
            OpacityConstants.low,
          ),
        ),
      ),
    );
  }
}

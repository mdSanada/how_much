import 'package:flutter/material.dart';

import '../../design/stylesheet.dart';

class MaterialItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const MaterialItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Stylesheet.body(),
        ),
        Text(
          value,
          style: Stylesheet.body(),
        ),
      ],
    );
  }
}

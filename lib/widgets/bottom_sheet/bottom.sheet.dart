import 'package:flutter/material.dart';

import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/sizes.dart';
import '../../design/stylesheet.dart';

class InfoBottomSheet extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoBottomSheet({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Stylesheet.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(CornerRadius.large),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(PaddingConstants.large),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: PaddingConstants.sMedium,
            ),
            child: Icon(
              icon,
              color: Stylesheet.black,
            ),
          ),
          Text(
            title,
            style: Stylesheet.subtitle(),
          ),
          const SizedBox(height: Sizes.medium),
          Text(
            description,
            style: Stylesheet.body(),
          ),
          const SizedBox(height: Sizes.footerBottomSheet),
        ],
      ),
    );
  }
}

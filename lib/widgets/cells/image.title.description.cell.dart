import 'package:flutter/material.dart';
import '../../design/stylesheet.dart';

import '../../design/corner.radius.dart';
import '../../design/padding.dart';
import '../../design/sizes.dart';

class ImageTextDescriptionCell extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final IconData? icon;
  final Color highlightColor;
  final void Function()? onPressed;

  const ImageTextDescriptionCell({
    super.key,
    required this.title,
    required this.description,
    required this.highlightColor,
    this.icon,
    this.onPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              CornerRadius.medium,
            ),
          ),
        ),
        backgroundColor: Stylesheet.white,
        foregroundColor: Stylesheet.black,
        padding: const EdgeInsets.all(PaddingConstants.sMedium),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Visibility(
            visible: icon != null,
            child: Container(
              height: Sizes.button,
              margin: const EdgeInsets.only(
                right: PaddingConstants.sMedium,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    CornerRadius.xlarge,
                  ),
                ),
              ),
              child: Icon(
                icon,
                color: highlightColor,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "${index}_title_$title",
                child: Text(
                  title,
                  style: Stylesheet.subtitle(),
                  textAlign: TextAlign.start,
                ),
              ),
              Text(
                description,
                style: Stylesheet.body(),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ],
      ),
    );
  }
}

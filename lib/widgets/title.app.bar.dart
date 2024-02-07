import 'package:flutter/material.dart';

import '../design/stylesheet.dart';
import 'container.line.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color highlightColor;
  final bool backButtonEnabled;
  final bool isClose;
  final double? titleSpacing;

  const TitleAppBar({
    super.key,
    required this.title,
    required this.highlightColor,
    this.isClose = false,
    this.backButtonEnabled = false,
    this.titleSpacing,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Stylesheet.backgroundColor,
      foregroundColor: Colors.black,
      surfaceTintColor: Stylesheet.backgroundColor,
      leading: backButtonEnabled
          ? IconButton(
              icon: Icon((isClose ? Icons.close : Icons.arrow_back),
                  color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      // leadingWidth: Sizes.button,
      centerTitle: false,
      titleSpacing: titleSpacing,
      title: Padding(
        padding: backButtonEnabled
            ? const EdgeInsets.all(0)
            : const EdgeInsets.all(
                0,
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Stylesheet.header02(),
                  ),
                  ContainerLine(highlightColor: highlightColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

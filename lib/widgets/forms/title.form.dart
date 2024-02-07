import 'package:flutter/material.dart';

import '../../design/corner.radius.dart';
import '../../design/stylesheet.dart';
import '../bottom_sheet/bottom.sheet.dart';

class TitleForm extends StatelessWidget {
  final bool hasInfo;
  final String title;
  final String description;

  const TitleForm({
    super.key,
    required this.hasInfo,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Stylesheet.body(),
        ),
        Visibility(
          visible: hasInfo,
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(CornerRadius.large),
                  ),
                ),
                builder: (BuildContext context) {
                  return InfoBottomSheet(
                    title: title,
                    description: description,
                    icon: Icons.info_outline,
                  );
                },
              );
            },
            icon: const Icon(
              Icons.info_outline,
              color: Stylesheet.black,
            ),
          ),
        )
      ],
    );
  }
}

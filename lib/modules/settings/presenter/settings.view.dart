import 'package:flutter/material.dart';

import '../../../consts/strings.dart';
import '../../../design/sizes.dart';
import '../../../design/stylesheet.dart';
import '../../../widgets/cells/image.title.description.cell.dart';
import '../../../widgets/padding.safe.area.dart';
import '../../../widgets/title.app.bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        title: StringsConsts.titleSettings,
        highlightColor: Stylesheet.tertiaryColor,
      ),
      body: PaddingSafeArea(
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            height: Sizes.sMedium,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ImageTextDescriptionCell(
              index: index,
              title: StringsConsts.placeholder,
              description: StringsConsts.placeholder,
              highlightColor: Stylesheet.tertiaryColor,
            );
          },
        ),
      ),
    );
  }
}

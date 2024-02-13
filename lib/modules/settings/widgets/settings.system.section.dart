import 'package:flutter/material.dart';
import 'package:how_much/consts/strings.dart';

import 'settings.icon.action.dart';
import 'settings.icon.action.groupped.dart';

class SettingSystemSection extends StatelessWidget {
  final void Function()? onPressedUpdateLocal;

  const SettingSystemSection({
    super.key,
    required this.onPressedUpdateLocal,
  });

  @override
  Widget build(BuildContext context) {
    return SettingIconActionGroupedCollection(
      title: StringsConsts.settingsSystemSection,
      items: [
        SettingsIconAction(
          title: StringsConsts.settingsUpdateLocalCache,
          onPressed: onPressedUpdateLocal,
          icon: Icons.update_outlined,
        ),
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:how_much/consts/strings.dart';

import '../../../design/corner.radius.dart';
import '../../../design/stylesheet.dart';
import '../../../widgets/bottom_sheet/bottom.sheet.dart';
import 'settings.icon.action.dart';
import 'settings.icon.action.groupped.dart';

enum SettingsGeneralType { help, bug, terms, policy }

class SettingsGeneralSection extends StatelessWidget {
  final void Function(SettingsGeneralType type) onPressed;

  const SettingsGeneralSection({
    super.key,
    required this.onPressed,
  });

  void showBottomSheet(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(CornerRadius.large),
        ),
      ),
      builder: (BuildContext context) {
        return InfoBottomSheet(
          title: title,
          description: description,
          icon: icon,
          color: Stylesheet.primaryColor,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingIconActionGroupedCollection(
      title: StringsConsts.settingsGeneralSection,
      items: [
        SettingsIconAction(
          title: StringsConsts.settingsAbout,
          onPressed: () {
            showBottomSheet(
              context,
              StringsConsts.settingsAbout,
              StringsConsts.settingsAboutDescription,
              Icons.info_outline,
            );
          },
          icon: Icons.info_outline,
        ),
        SettingsIconAction(
          title: StringsConsts.settingsHelp,
          onPressed: () {
            onPressed(SettingsGeneralType.help);
          },
          icon: Icons.help_outline,
        ),
        SettingsIconAction(
          title: StringsConsts.settingsBug,
          onPressed: () {
            onPressed(SettingsGeneralType.bug);
          },
          icon: Icons.bug_report_outlined,
        ),
        SettingsIconAction(
          title: StringsConsts.settingsTermsOfUse,
          onPressed: () {
            onPressed(SettingsGeneralType.terms);
          },
          icon: Icons.description_outlined,
        ),
        SettingsIconAction(
          title: StringsConsts.settingsPrivacyPolicy,
          onPressed: () {
            onPressed(SettingsGeneralType.policy);
          },
          icon: Icons.privacy_tip_outlined,
        ),
      ],
    );
  }
}

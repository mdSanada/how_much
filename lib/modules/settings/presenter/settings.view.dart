import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:how_much/modules/settings/data/repositories/settings.repository.dart';
import 'package:how_much/modules/settings/domain/usecase/get.user.dart';

import '../../../auth/apple.auth.dart';
import '../../../auth/google.auth.dart';
import '../../../consts/strings.dart';
import '../../../design/corner.radius.dart';
import '../../../design/sizes.dart';
import '../../../design/stylesheet.dart';
import '../../../network/database/user.network.database.dart';
import '../../../widgets/bottom_sheet/bottom.sheet.dart';
import '../../../widgets/button.signout.dart';
import '../../../widgets/inset_grouped/key.value.model.dart';
import '../../../widgets/padding.scrollable.safe.area.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/title.app.bar.dart';
import '../../../widgets/version.label.dart';
import '../../sign/data/datasource/sign.datasource.dart';
import '../../sign/data/repositories/signin.repository.dart';
import '../../sign/domain/usecase/signout.dart';
import '../../sign/presenter/sign.view.dart';
import '../data/datasource/settings.datasource.dart';
import '../widgets/settings.action.grouped.dart';
import '../widgets/settings.general.section.dart';
import '../widgets/settings.grouped.collection.dart';
import '../widgets/settings.header.dart';
import '../widgets/settings.icon.action.dart';
import '../widgets/settings.icon.action.groupped.dart';
import '../widgets/settings.system.section.dart';
import 'settings.viewmodel.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsViewModel viewModel = SettingsViewModel(
    googleSignOut: SignOut(
      repository: SignRepositoy(
        dataSource: SignDataSource(
          database: UserNetworkDatabase(),
          auth: GoogleAuth(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
          ),
        ),
      ),
    ),
    appleSignOut: SignOut(
      repository: SignRepositoy(
        dataSource: SignDataSource(
          database: UserNetworkDatabase(),
          auth: AppleAuth(
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
      ),
    ),
    getUser: GetUser(
      repository: SettingsRepositoy(
        dataSource: SettingsDataSource(),
      ),
    ),
  );

  @override
  void initState() {
    viewModel.configure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.backgroundColor,
      appBar: TitleAppBar(
        title: StringsConsts.titleSettings,
        highlightColor: Stylesheet.tertiaryColor,
      ),
      body: PaddingScrollableSafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (context) => SettingsHeader(
                letters: viewModel.letters,
                name: viewModel.name,
                subscription: viewModel.subscription,
              ),
            ),
            const Spacing(),
            Observer(
              builder: (context) => SettingGroupedCollection(
                title: StringsConsts.settingsAccountSection,
                items: [
                  KeyValue(
                    key: StringsConsts.settingsEmail,
                    value: viewModel.email,
                  ),
                ],
              ),
            ),
            const Spacing(),
            Observer(
              builder: (context) => SettingActionGroupedCollection(
                title: StringsConsts.settingsSubscriptionSection,
                items: [
                  KeyValue(
                    key: StringsConsts.settingsSubscription,
                    value: viewModel.subscription,
                  ),
                ],
              ),
            ),
            const Spacing(),
            SettingSystemSection(
              onPressedUpdateLocal: () {
                viewModel.updateLocalData();
              },
            ),
            const Spacing(),
            SettingsGeneralSection(
              onPressed: (SettingsGeneralType type) {
                viewModel.generalLaunch(type, context);
              },
            ),
            const Spacing(),
            Center(
              child: SignOutButton(
                onPressed: () async {
                  await viewModel.signout(context);

                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const SignView(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            const Spacing(
              size: Sizes.small,
            ),
            Center(
              child: Observer(
                builder: (context) => VersionLabel(
                  version: viewModel.version,
                ),
              ),
            ),
            const Spacing(),
          ],
        ),
      ),
    );
  }
}

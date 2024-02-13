import 'package:flutter/cupertino.dart';

import 'package:how_much/modules/settings/widgets/settings.general.section.dart';
import 'package:how_much/modules/webview/webview.view.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../consts/strings.dart';
import '../../sign/domain/usecase/signout.dart';

part 'settings.viewmodel.g.dart';

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase with Store {
  final SignOut googleSignOut;
  final SignOut appleSignOut;

  @observable
  String name = "";

  @observable
  String letters = "";

  @observable
  String email = "";

  @observable
  String subscription = "";

  @observable
  String version = "";

  SettingsViewModelBase({
    required this.googleSignOut,
    required this.appleSignOut,
  });

  @action
  Future<void> configure() async {
    updateName();
    updateLetters();
    updateEmail();
    updateSubscription();
    updateVersion();
  }

  @action
  Future<void> signout() async {
    await googleSignOut();
    await appleSignOut();
  }

  @action
  void updateLocalData() {}

  @action
  void generalLaunch(SettingsGeneralType type, BuildContext context) {
    switch (type) {
      case SettingsGeneralType.help:
        launch("help@howmuch.com.br", "Ajuda", "ajuda");
      case SettingsGeneralType.bug:
        launch("bug@howmuch.com.br", "Ajuda", "ajuda");
      case SettingsGeneralType.terms:
        Navigator.of(context, rootNavigator: true).push(
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => CustomWebView(
              title: StringsConsts.settingsTermsOfUse,
              url:
                  "https://api.flutter.dev/flutter/material/showModalBottomSheet.html",
            ),
          ),
        );
      case SettingsGeneralType.policy:
        Navigator.of(context, rootNavigator: true).push(
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => CustomWebView(
              title: StringsConsts.settingsPrivacyPolicy,
              url: "https://www.google.com",
            ),
          ),
        );
    }
  }

  Future<void> launch(String email, String subject, String message) async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(
        <String, String>{
          'subject': subject,
          'body': message,
        },
      ),
    ).toString();
    final emailUrl = Uri.parse(emailUri);
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  updateName() {
    name = "matheus";
  }

  updateLetters() {
    letters = "ms";
  }

  updateEmail() {
    email = "maatheusdavid@me.com";
  }

  updateSubscription() {
    subscription = "free".toUpperCase();
  }

  updateVersion() {
    version = "1.0.0";
  }
}

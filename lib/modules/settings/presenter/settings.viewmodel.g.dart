// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on SettingsViewModelBase, Store {
  late final _$nameAtom =
      Atom(name: 'SettingsViewModelBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$lettersAtom =
      Atom(name: 'SettingsViewModelBase.letters', context: context);

  @override
  String get letters {
    _$lettersAtom.reportRead();
    return super.letters;
  }

  @override
  set letters(String value) {
    _$lettersAtom.reportWrite(value, super.letters, () {
      super.letters = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SettingsViewModelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$subscriptionAtom =
      Atom(name: 'SettingsViewModelBase.subscription', context: context);

  @override
  String get subscription {
    _$subscriptionAtom.reportRead();
    return super.subscription;
  }

  @override
  set subscription(String value) {
    _$subscriptionAtom.reportWrite(value, super.subscription, () {
      super.subscription = value;
    });
  }

  late final _$versionAtom =
      Atom(name: 'SettingsViewModelBase.version', context: context);

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$configureAsyncAction =
      AsyncAction('SettingsViewModelBase.configure', context: context);

  @override
  Future<void> configure() {
    return _$configureAsyncAction.run(() => super.configure());
  }

  late final _$signoutAsyncAction =
      AsyncAction('SettingsViewModelBase.signout', context: context);

  @override
  Future<void> signout(BuildContext context) {
    return _$signoutAsyncAction.run(() => super.signout(context));
  }

  late final _$SettingsViewModelBaseActionController =
      ActionController(name: 'SettingsViewModelBase', context: context);

  @override
  void updateLocalData() {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.updateLocalData');
    try {
      return super.updateLocalData();
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void generalLaunch(SettingsGeneralType type, BuildContext context) {
    final _$actionInfo = _$SettingsViewModelBaseActionController.startAction(
        name: 'SettingsViewModelBase.generalLaunch');
    try {
      return super.generalLaunch(type, context);
    } finally {
      _$SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
letters: ${letters},
email: ${email},
subscription: ${subscription},
version: ${version}
    ''';
  }
}

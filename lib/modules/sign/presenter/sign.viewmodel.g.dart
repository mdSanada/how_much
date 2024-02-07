// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignViewModel on SignViewModelBase, Store {
  late final _$googleIsLoadingAtom =
      Atom(name: 'SignViewModelBase.googleIsLoading', context: context);

  @override
  bool get googleIsLoading {
    _$googleIsLoadingAtom.reportRead();
    return super.googleIsLoading;
  }

  @override
  set googleIsLoading(bool value) {
    _$googleIsLoadingAtom.reportWrite(value, super.googleIsLoading, () {
      super.googleIsLoading = value;
    });
  }

  late final _$appleIsLoadingAtom =
      Atom(name: 'SignViewModelBase.appleIsLoading', context: context);

  @override
  bool get appleIsLoading {
    _$appleIsLoadingAtom.reportRead();
    return super.appleIsLoading;
  }

  @override
  set appleIsLoading(bool value) {
    _$appleIsLoadingAtom.reportWrite(value, super.appleIsLoading, () {
      super.appleIsLoading = value;
    });
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('SignViewModelBase.signInWithGoogle', context: context);

  @override
  Future<void> signInWithGoogle(BuildContext context) {
    return _$signInWithGoogleAsyncAction
        .run(() => super.signInWithGoogle(context));
  }

  late final _$signInWithAppleAsyncAction =
      AsyncAction('SignViewModelBase.signInWithApple', context: context);

  @override
  Future<void> signInWithApple(BuildContext context) {
    return _$signInWithAppleAsyncAction
        .run(() => super.signInWithApple(context));
  }

  @override
  String toString() {
    return '''
googleIsLoading: ${googleIsLoading},
appleIsLoading: ${appleIsLoading}
    ''';
  }
}

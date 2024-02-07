import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/logger.dart';
import '../../bottom_navigation/presenter/bottom.navigation.view.dart';
import '../domain/usecase/signin.dart';

part 'sign.viewmodel.g.dart';

class SignViewModel = SignViewModelBase with _$SignViewModel;

abstract class SignViewModelBase with Store {
  @observable
  bool googleIsLoading = false;
  @observable
  bool appleIsLoading = false;

  final SignIn googleSignIn;
  final SignIn appleSignIn;

  SignViewModelBase({
    required this.googleSignIn,
    required this.appleSignIn,
  });

  @action
  Future<void> signInWithGoogle(BuildContext context) async {
    googleIsLoading = true;
    final user = await googleSignIn.call();
    user.fold(
      (l) => {
        Logger.log(l),
        googleIsLoading = false,
      },
      (r) => {
        Logger.log(r),
        googleIsLoading = false,
        goToHome(context),
      },
    );
  }

  @action
  Future<void> signInWithApple(BuildContext context) async {
    appleIsLoading = true;
    final user = await appleSignIn.call();
    user.fold(
      (l) => {
        Logger.log(l),
        appleIsLoading = false,
      },
      (r) => {
        Logger.log(r),
        appleIsLoading = false,
        goToHome(context),
      },
    );
  }

  void goToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const BottomNavigationView()),
      (Route<dynamic> route) => false,
    );
  }
}

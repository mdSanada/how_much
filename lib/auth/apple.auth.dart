import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../error/error.dart';
import '../modules/sign/data/models/logged.user.dart';
import '../user/current.user.dart';
import 'auth.protocol.dart';

class AppleAuth implements AuthProtocol {
  final FirebaseAuth firebaseAuth;

  AppleAuth({
    required this.firebaseAuth,
  });

  @override
  Future<LoggedUser> signin() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final AuthCredential authCredential = OAuthProvider(
        'apple.com',
      ).credential(
        accessToken: credential.authorizationCode,
        idToken: credential.identityToken,
      );

      try {
        final firebaseUser = await firebaseAuth.signInWithCredential(
          authCredential,
        );
        final User? user = firebaseUser.user;
        final LoggedUser loggedUser = LoggedUser.fromAuth(user!);
        CurrentUser().setUser = loggedUser;
        return loggedUser;
      } on PlatformException catch (_) {
        throw Unauthorized();
      } catch (e) {
        throw Unauthorized();
      }
    } catch (e) {
      throw Unauthorized();
    }
  }

  @override
  Future<LoggedUser> getUser() async {
    if (CurrentUser().user != null) {
      return CurrentUser().user!;
    }
    if (firebaseAuth.currentUser != null) {
      final LoggedUser loggedUser =
          LoggedUser.fromAuth(firebaseAuth.currentUser!);
      CurrentUser().setUser = loggedUser;
      return loggedUser;
    }
    throw Unauthorized();
  }

  @override
  Future<void> signOut() async {
    CurrentUser().clear();
    await firebaseAuth.signOut();
  }
}

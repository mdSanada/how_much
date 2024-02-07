import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../error/error.dart';
import '../modules/sign/data/models/logged.user.dart';
import '../user/current.user.dart';
import 'auth.protocol.dart';

class GoogleAuth implements AuthProtocol {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  GoogleAuth({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<LoggedUser> signin() async {
    GoogleSignInAccount? googleSignInAccount;

    try {
      googleSignInAccount =
          await googleSignIn.signIn().catchError((onError) => null);
    } catch (e) {
      throw Unauthorized();
    }

    if (googleSignInAccount == null) {
      throw Unauthorized();
    }

    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      final UserCredential authResult =
          await firebaseAuth.signInWithCredential(credential);
      final User? user = authResult.user;
      final LoggedUser loggedUser = LoggedUser.fromAuth(user!);
      CurrentUser().setUser = loggedUser;
      return loggedUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw Unauthorized();
      } else if (e.code == 'invalid-credential') {
        throw Unauthorized();
      }
    } catch (e) {
      throw Unauthorized();
    }
    throw Unauthorized();
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
    await googleSignIn.signOut();
  }
}

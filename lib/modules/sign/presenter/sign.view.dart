import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../auth/apple.auth.dart';
import '../../../auth/google.auth.dart';
import '../../../design/stylesheet.dart';
import '../../../network/database/user.network.database.dart';
import '../../../widgets/sign/sign.sheet.dart';
import '../../../widgets/sign/welcome.container.dart';
import '../data/datasource/sign.datasource.dart';

import '../data/repositories/signin.repository.dart';
import '../domain/usecase/signin.dart';
import 'sign.viewmodel.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
  final SignViewModel viewModel = SignViewModel(
    googleSignIn: SignIn(
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
    appleSignIn: SignIn(
      repository: SignRepositoy(
        dataSource: SignDataSource(
          database: UserNetworkDatabase(),
          auth: AppleAuth(
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
      ),
    ),
  );

  bool fadeIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylesheet.black,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeContainer(),
            Observer(
              builder: (context) => IgnorePointer(
                ignoring: viewModel.googleIsLoading || viewModel.appleIsLoading,
                child: SignSheet(
                  googleIsLoading: viewModel.googleIsLoading,
                  appleIsLoading: viewModel.appleIsLoading,
                  fadeIn: fadeIn,
                  onTapGoogleSign: () {
                    viewModel.signInWithGoogle(
                      context,
                    );
                    setState(() {
                      fadeIn = true;
                    });
                  },
                  onTapAppleSign: () {
                    viewModel.signInWithApple(
                      context,
                    );
                    setState(() {
                      fadeIn = true;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

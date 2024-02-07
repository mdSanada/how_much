import 'package:firebase_auth/firebase_auth.dart';
import 'package:how_much/modules/sign/domain/entities/logged.user.dart';

class LoggedUser extends LoggedUserEntity {
  const LoggedUser(
      {required super.id, required super.name, required super.email});

  factory LoggedUser.fromAuth(User user) {
    return LoggedUser(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
}

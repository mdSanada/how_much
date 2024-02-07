import '../modules/sign/data/models/logged.user.dart';

abstract class AuthProtocol {
  Future<LoggedUser> signin();
  Future<LoggedUser> getUser();
  Future<void> signOut();
}

import '../../../../auth/auth.protocol.dart';
import '../../../../network/protocol/users.database.protocol.dart';
import '../models/logged.user.dart';

abstract class SignDataSourceProtocol {
  Future<LoggedUser> signIn();
  Future<void> signOut(LoggedUser user);
  Future<LoggedUser> getUser();
}

class SignDataSource implements SignDataSourceProtocol {
  final UsersDatabaseProtocol database;
  final AuthProtocol auth;

  SignDataSource({
    required this.auth,
    required this.database,
  });

  @override
  Future<LoggedUser> signIn() async {
    try {
      final user = await auth.signin();
      await database.addUser(
        user.id,
        Map.of(
          {
            "name": user.name,
            "email": user.email,
          },
        ),
      );
      return user;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> signOut(LoggedUser user) async {
    try {
      return await auth.signOut();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<LoggedUser> getUser() async {
    try {
      return await auth.getUser();
    } catch (e) {
      throw Exception();
    }
  }
}

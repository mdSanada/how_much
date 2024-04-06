import 'package:how_much/error/error.dart';

import '../../../../auth/auth.protocol.dart';
import '../../../../network/protocol/users.database.protocol.dart';
import '../../../../user/current.user.dart';

abstract class SettingsDataSourceProtocol {
  Future<String> name();
  Future<String> letters();
  Future<String> email();
}

class SettingsDataSource implements SettingsDataSourceProtocol {
  final CurrentUser userDatabase;

  SettingsDataSource() : userDatabase = CurrentUser();

  @override
  Future<String> email() {
    final user = userDatabase.user;
    if (user != null) {
      return Future.value(user.email);
    }
    throw Unauthorized();
  }

  @override
  Future<String> letters() {
    final user = userDatabase.user;
    if (user != null) {
      final name = user.name;
      final letters = name.split(' ');
      if (letters.length >= 2) {
        return Future.value(letters[0][0] + letters[1][0]);
      } else if (letters.isNotEmpty) {
        return Future.value(letters[0][0]);
      }
      throw Unauthorized();
    }
    throw Unauthorized();
  }

  @override
  Future<String> name() {
    final user = userDatabase.user;
    if (user != null) {
      return Future.value(user.name);
    }
    throw Unauthorized();
  }
}

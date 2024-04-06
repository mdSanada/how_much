import 'package:how_much/modules/sign/data/models/logged.user.dart';

class CurrentUser {
  static final CurrentUser _singleton = CurrentUser._internal();

  factory CurrentUser() {
    return _singleton;
  }

  CurrentUser._internal();

  LoggedUser? _user;

  LoggedUser? get user => _user;

  set setUser(LoggedUser? user) {
    _user = user;
  }

  void clear() {
    _user = null;
  }
}

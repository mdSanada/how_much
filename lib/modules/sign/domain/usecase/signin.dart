import 'package:dartz/dartz.dart';
import 'package:how_much/modules/sign/domain/entities/logged.user.dart';
import 'package:how_much/modules/sign/domain/repositories/sign.repository.protocol.dart';

import '../../../../error/error.dart';

class SignIn {
  final SignRepositoryProtocol repository;

  SignIn({
    required this.repository,
  });

  Future<Either<Failure, LoggedUserEntity>> call() async {
    return await repository.signIn();
  }
}

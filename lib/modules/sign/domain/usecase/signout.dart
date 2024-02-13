import 'package:dartz/dartz.dart';
import 'package:how_much/modules/sign/domain/entities/logged.user.dart';
import 'package:how_much/modules/sign/domain/repositories/sign.repository.protocol.dart';

import '../../../../error/error.dart';

class SignOut {
  final SignRepositoryProtocol repository;

  SignOut({
    required this.repository,
  });

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}

import 'package:dartz/dartz.dart';

import '../../../../error/error.dart';
import '../repositories/sign.repository.protocol.dart';

class SignOut {
  final SignRepositoryProtocol repository;

  SignOut({
    required this.repository,
  });

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}

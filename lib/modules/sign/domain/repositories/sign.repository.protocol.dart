import 'package:dartz/dartz.dart';

import '../../../../error/error.dart';
import '../entities/logged.user.dart';

abstract class SignRepositoryProtocol {
  Future<Either<Failure, LoggedUserEntity>> signIn();
  Future<Either<Failure, void>> signOut();
}

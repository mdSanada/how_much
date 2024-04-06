import 'package:dartz/dartz.dart';

import '../../../../error/error.dart';

abstract class SettingsRepositoryProtocol {
  Future<Either<Failure, String>> name();
  Future<Either<Failure, String>> letters();
  Future<Either<Failure, String>> email();
}

import 'package:dartz/dartz.dart';

import '../../../../error/error.dart';
import '../../domain/entities/logged.user.dart';
import '../../domain/repositories/sign.repository.protocol.dart';
import '../datasource/sign.datasource.dart';
import '../models/logged.user.dart';

class SignRepositoy extends SignRepositoryProtocol {
  final SignDataSourceProtocol dataSource;

  SignRepositoy({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, LoggedUser>> signIn() async {
    try {
      final loggedUser = await dataSource.signIn();
      return Right(loggedUser);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut(LoggedUserEntity user) async {
    try {
      final signOut = await dataSource.signOut(user as LoggedUser);
      return Right(signOut);
    } on Exception {
      return Left(JSONFailure());
    }
  }
}

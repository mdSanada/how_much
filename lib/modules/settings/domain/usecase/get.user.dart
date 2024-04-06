import 'package:dartz/dartz.dart';

import '../../../../error/error.dart';
import '../repositories/settings.repository.protocol.dart';

class GetUser {
  final SettingsRepositoryProtocol repository;

  GetUser({
    required this.repository,
  });

  Future<Either<Failure, String>> name() async {
    return await repository.name();
  }

  Future<Either<Failure, String>> letters() async {
    return await repository.letters();
  }

  Future<Either<Failure, String>> email() async {
    return await repository.email();
  }
}

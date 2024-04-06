import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:how_much/modules/settings/data/datasource/settings.datasource.dart';

import '../../../../error/error.dart';
import '../../domain/repositories/settings.repository.protocol.dart';

class SettingsRepositoy extends SettingsRepositoryProtocol {
  final SettingsDataSource dataSource;

  SettingsRepositoy({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, String>> email() async {
    try {
      final email = await dataSource.email();
      return Right(email);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, String>> letters() async {
    try {
      final letters = await dataSource.letters();
      return Right(letters);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, String>> name() async {
    try {
      final name = await dataSource.name();
      return Right(name);
    } on Exception {
      return Left(JSONFailure());
    }
  }
}

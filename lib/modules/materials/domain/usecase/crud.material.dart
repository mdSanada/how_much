import 'package:dartz/dartz.dart';

import '../../../../error/error.dart';
import '../repositories/material.repository.protocol.dart';
import '../entities/material.entity.dart';

class MaterialsUseCase {
  final MaterialRepositoryProtocol repository;

  MaterialsUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<MaterialEntity>>> fetch(
    bool forceRefresh,
  ) async {
    return await repository.fetch(
      forceRefresh,
    );
  }

  Future<Either<Failure, MaterialEntity>> read(String id) async {
    return await repository.read(id);
  }

  Future<Either<Failure, void>> save(MaterialEntity material) async {
    return await repository.save(material);
  }

  Future<Either<Failure, MaterialEntity>> edit(MaterialEntity material) async {
    return await repository.edit(material);
  }

  Future<Either<Failure, bool>> delete(String id) async {
    return await repository.delete(id);
  }
}

import 'package:dartz/dartz.dart';

import '../../../../error/error.dart';
import '../entities/material.entity.dart';

abstract class MaterialRepositoryProtocol {
  Future<Either<Failure, List<MaterialEntity>>> fetch(
    bool forceRefresh,
  );
  Future<Either<Failure, MaterialEntity>> read(String id);
  Future<Either<Failure, void>> save(MaterialEntity material);
  Future<Either<Failure, MaterialEntity>> edit(MaterialEntity material);
  Future<Either<Failure, bool>> delete(String id);
}

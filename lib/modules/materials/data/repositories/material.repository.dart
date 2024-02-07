import 'package:dartz/dartz.dart';

import 'package:how_much/error/error.dart';
import 'package:how_much/modules/materials/data/datasource/material.datasource.dart';
import 'package:how_much/modules/materials/data/models/material.model.dart';

import '../../domain/entities/material.entity.dart';
import '../../domain/repositories/material.repository.protocol.dart';

class MaterialRepository implements MaterialRepositoryProtocol {
  final MaterialDataSourceProtocol dataSource;

  MaterialRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> delete(String id) async {
    try {
      final deleted = await dataSource.deleteMaterial(id);
      return Right(deleted);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, MaterialEntity>> edit(MaterialEntity material) async {
    try {
      final edited =
          await dataSource.editMaterial(MaterialModel.fromEntity(material));
      return Right(edited);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> fetch(
    bool forceRefresh,
  ) async {
    try {
      final materials = await dataSource.fetchMaterials(
        forceRefresh,
      );
      return Right(materials);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, MaterialEntity>> read(String id) async {
    try {
      final material = await dataSource.readMaterial(id);
      return Right(material);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, void>> save(MaterialEntity material) async {
    try {
      final saved =
          await dataSource.saveMaterial(MaterialModel.fromEntity(material));
      return Right(saved);
    } on Exception {
      return Left(JSONFailure());
    }
  }
}

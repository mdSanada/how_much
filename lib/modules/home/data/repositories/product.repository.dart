import 'package:dartz/dartz.dart';
import 'package:how_much/modules/home/data/datasource/product.datasource.dart';
import 'package:how_much/modules/home/data/models/product.model.dart';

import '../../../../error/error.dart';
import '../../domain/entities/product.entity.dart';
import '../../domain/repositories/product.repository.protocol.dart';

class ProductRepository implements ProductRepositoryProtocol {
  final ProductDataSourceProtocol dataSource;

  ProductRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> delete(String id) async {
    try {
      final deleted = await dataSource.deleteProduct(id);
      return Right(deleted);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> edit(ProductEntity product) async {
    try {
      final edited = await dataSource.editProduct(product as ProductModel);
      return Right(edited);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAll(
    bool forceRefresh,
  ) async {
    try {
      final materials = await dataSource.fetchProducts(forceRefresh);
      return Right(materials);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> read(String id) async {
    try {
      final material = await dataSource.readProduct(id);
      return Right(material);
    } on Exception {
      return Left(JSONFailure());
    }
  }

  @override
  Future<Either<Failure, void>> save(ProductEntity product) async {
    try {
      final saved = await dataSource.saveProduct(
        ProductModel.fromEntity(
          product,
        ),
      );
      return Right(saved);
    } on Exception {
      return Left(JSONFailure());
    }
  }
}

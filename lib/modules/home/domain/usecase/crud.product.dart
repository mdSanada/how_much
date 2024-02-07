import 'package:dartz/dartz.dart';
import '../../../../error/error.dart';
import '../entities/product.entity.dart';
import '../repositories/product.repository.protocol.dart';

class CrudProductUseCase {
  final ProductRepositoryProtocol repository;

  CrudProductUseCase({
    required this.repository,
  });

  Future<Either<Failure, void>> create(ProductEntity product) async {
    return await repository.save(product);
  }

  Future<Either<Failure, List<ProductEntity>>> fetch(
    bool forceRefresh,
  ) async {
    return await repository.fetchAll(forceRefresh);
  }

  Future<Either<Failure, ProductEntity>> read(String productId) async {
    return await repository.read(productId);
  }

  Future<Either<Failure, ProductEntity>> edit(ProductEntity product) async {
    return await repository.edit(product);
  }

  Future<Either<Failure, bool>> delete(String productId) async {
    return await repository.delete(productId);
  }
}

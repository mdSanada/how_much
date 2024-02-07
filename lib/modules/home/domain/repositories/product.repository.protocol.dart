import 'package:dartz/dartz.dart';
import 'package:how_much/modules/home/domain/entities/product.entity.dart';

import '../../../../error/error.dart';

abstract class ProductRepositoryProtocol {
  Future<Either<Failure, List<ProductEntity>>> fetchAll(
    bool forceRefresh,
  );
  Future<Either<Failure, ProductEntity>> read(String id);
  Future<Either<Failure, void>> save(ProductEntity product);
  Future<Either<Failure, ProductEntity>> edit(ProductEntity product);
  Future<Either<Failure, bool>> delete(String id);
}

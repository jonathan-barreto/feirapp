import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/products_and_pagination_entity.dart';
import 'package:feirapp/src/domain/repositories/product_repository.dart';

class GetMoreProductsByLinkUsecase
    implements Usecase<ProductsAndPaginationEntity, String> {
  final ProductRepository repository;

  GetMoreProductsByLinkUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductsAndPaginationEntity>> call(
    String params,
  ) async {
    return await repository.getMoreProductsByLink(url: params);
  }
}

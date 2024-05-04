import 'package:dartz/dartz.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/core/usecase/usecase.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';

class GetMoreProductsByLinkUsecase
    implements Usecase<ProductDataEntity, String> {
  final ProductRepository repository;

  GetMoreProductsByLinkUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductDataEntity>> call(String params) async {
    return await repository.getMoreProductsByLinkUsecase(link: params);
  }
}

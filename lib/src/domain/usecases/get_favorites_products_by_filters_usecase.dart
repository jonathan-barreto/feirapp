import 'package:dartz/dartz.dart';
import 'package:feirapp/src/core/errors/failure.dart';
import 'package:feirapp/src/core/usecase/usecase.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';
import 'package:feirapp/src/domain/repositories/local_product_repository.dart';

class GetFavoritesProductsByFiltersUsecase implements Usecase<List<String>, SelectedFiltersEntity> {
  final LocalProductRepository repository;

  GetFavoritesProductsByFiltersUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<String>>> call(SelectedFiltersEntity params) async {
    return repository.getFavoriteProductsByFilters(filters: params);
  }
}

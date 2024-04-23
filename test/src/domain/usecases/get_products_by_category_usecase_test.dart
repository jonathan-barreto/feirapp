import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/domain/entities/page_link_entity.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';
import 'package:sabor_natural_app/src/domain/repositories/product_repository.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_products_by_category_usecase.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ProductRepository repository;
  late GetProductsByCategoryUsecase usecase;

  setUp(() {
    repository = MockProductRepository();

    usecase = GetProductsByCategoryUsecase(
      repository: repository,
    );
  });

  const ProductEntity productEntity = ProductEntity(
    id: 1,
    name: 'Abacate',
    category: 'fruta',
    unit: 'unidade',
    price: '0.99',
    image: 'abacate.png',
  );

  const PageLinkEntity pageLinkEntity = PageLinkEntity(
    first: 'http://127.0.0.1:8000/api/products?page=1',
    next: 'http://127.0.0.1:8000/api/products?page=2',
  );

  const ProductDataEntity productDataEntity = ProductDataEntity(
    products: [productEntity],
    links: pageLinkEntity,
  );

  const String categoryProduct = 'fruta';

  test('should get product data entity from the repository', () async {
    when(() {
      return repository.getProductsByCategory(
        productCategory: categoryProduct,
      );
    }).thenAnswer((invocation) async {
      return const Right(productDataEntity);
    });

    final result = await usecase(categoryProduct);

    expectLater(
      result,
      const Right<Failure, ProductDataEntity>(productDataEntity),
    );

    verify(() {
      return repository.getProductsByCategory(
        productCategory: categoryProduct,
      );
    }).called(1);
  });

  test('should return a ServerFailure when dont\'t succeed', () async {
    when(() {
      return repository.getProductsByCategory(
        productCategory: categoryProduct,
      );
    }).thenAnswer((invocation) async {
      return Left<Failure, ProductDataEntity>(ServerFailure());
    });

    final result = await usecase(categoryProduct);

    expectLater(
      result,
      Left(ServerFailure()),
    );

    verify(() {
      return repository.getProductsByCategory(
        productCategory: categoryProduct,
      );
    }).called(1);
  });
}

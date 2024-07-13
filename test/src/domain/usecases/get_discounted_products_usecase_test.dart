// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:feirapp/src/core/errors/failure.dart';
// import 'package:feirapp/src/core/usecase/usecase.dart';
// import 'package:feirapp/src/domain/entities/page_link_entity.dart';
// import 'package:feirapp/src/domain/entities/product_data_entity.dart';
// import 'package:feirapp/src/domain/entities/product_entity.dart';
// import 'package:feirapp/src/domain/repositories/product_repository.dart';
// import 'package:feirapp/src/domain/usecases/get_discounted_products_usecase.dart';

// class MockProductRepository extends Mock implements ProductRepository {}

// void main() {
//   late ProductRepository repository;
//   late GetProductsWithDiscountUsecase usecase;

//   setUp(() {
//     repository = MockProductRepository();

//     usecase = GetProductsWithDiscountUsecase(
//       repository: repository,
//     );
//   });

//   final NoParams noParams = NoParams();

//   const ProductEntity productEntity = ProductEntity(
//     id: 1,
//     name: 'Abacate',
//     category: 'fruta',
//     unit: 'unidade',
//     price: '0.99',
//     image: 'abacate.png',
//   );

//   const PageLinkEntity pageLinkEntity = PageLinkEntity(
//     first: 'http://127.0.0.1:8000/api/products?page=1',
//     next: 'http://127.0.0.1:8000/api/products?page=2',
//   );

//   const ProductDataEntity productDataEntity = ProductDataEntity(
//     products: [productEntity],
//     links: pageLinkEntity,
//   );

//   test('should get product data entity from the repository', () async {
//     when(() {
//       return repository.getDiscountedProducts();
//     }).thenAnswer((invocation) async {
//       return const Right(productDataEntity);
//     });

//     final result = await usecase(noParams);

//     expectLater(
//       result,
//       const Right<Failure, ProductDataEntity>(productDataEntity),
//     );

//     verify(() {
//       return repository.getDiscountedProducts();
//     }).called(1);
//   });

//   test('should return a ServerFailure when dont\'t succeed', () async {
//     when(() {
//       return repository.getDiscountedProducts();
//     }).thenAnswer((invocation) async {
//       return Left<Failure, ProductDataEntity>(ServerFailure());
//     });

//     final result = await usecase(noParams);

//     expectLater(
//       result,
//       Left(ServerFailure()),
//     );

//     verify(() {
//       return repository.getDiscountedProducts();
//     }).called(1);
//   });
// }

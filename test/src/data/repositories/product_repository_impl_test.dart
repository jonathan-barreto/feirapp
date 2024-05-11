// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:sabor_natural_app/src/core/errors/exceptions.dart';
// import 'package:sabor_natural_app/src/core/errors/failure.dart';
// import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
// import 'package:sabor_natural_app/src/data/model/page_link_model.dart';
// import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
// import 'package:sabor_natural_app/src/data/model/product_model.dart';
// import 'package:sabor_natural_app/src/data/repositories/product_repository_impl.dart';

// class MockProductDatasource extends Mock implements ProductDatasource {}

// void main() {
//   late ProductDatasource datasource;
//   late ProductRepositoryImpl repository;

//   setUp(() {
//     datasource = MockProductDatasource();

//     repository = ProductRepositoryImpl(
//       datasource: datasource,
//     );
//   });

//   const ProductModel productModel = ProductModel(
//     id: 1,
//     name: 'Abacate',
//     category: 'fruta',
//     unit: 'unidade',
//     price: '0.99',
//     image: 'abacate.png',
//   );

//   const PageLinkModel pageLinkModel = PageLinkModel(
//     first: 'http://127.0.0.1:8000/api/products?page=1',
//     next: 'http://127.0.0.1:8000/api/products?page=2',
//   );

//   const ProductDataModel productDataModel = ProductDataModel(
//     productsModel: [productModel],
//     linksModel: pageLinkModel,
//   );

//   const String category = 'fruta';
//   const String name = 'morango';
//   const List<int> ids = [1];

//   void setUpDataSourceToReturnProductDataModel({
//     required Future<ProductDataModel> Function() function,
//   }) {
//     when(() => function()).thenAnswer((_) async => productDataModel);
//   }

//   void setUpDataSourceToThrowException({
//     required Future<ProductDataModel> Function() function,
//   }) {
//     when(() => function()).thenThrow(ServerException());
//   }

//   test('sholud return product data model in getAllProducts', () async {
//     setUpDataSourceToReturnProductDataModel(
//       function: () => datasource.getAllProducts(),
//     );

//     final result = await repository.getAllProducts();

//     expect(result, const Right(productDataModel));

//     verify(() {
//       datasource.getAllProducts();
//     }).called(1);
//   });

//   test('server failure in getAllProducts', () async {
//     setUpDataSourceToThrowException(
//       function: () => datasource.getAllProducts(),
//     );

//     final result = await repository.getAllProducts();

//     expectLater(result, Left(ServerFailure()));

//     verify(() {
//       datasource.getAllProducts();
//     }).called(1);
//   });

//   test('sholud return product data model in getProductsByIds', () async {
//     setUpDataSourceToReturnProductDataModel(
//       function: () => datasource.getProductsByIds(
//         productIds: ids,
//       ),
//     );

//     final result = await repository.getProductsByIds(
//       productIds: ids,
//     );

//     expect(result, const Right(productDataModel));

//     verify(() {
//       datasource.getProductsByIds(
//         productIds: ids,
//       );
//     }).called(1);
//   });

//   test('server failure in getProductsByIds', () async {
//     setUpDataSourceToThrowException(
//       function: () => datasource.getProductsByIds(
//         productIds: ids,
//       ),
//     );

//     final result = await repository.getProductsByIds(
//       productIds: ids,
//     );

//     expectLater(result, Left(ServerFailure()));

//     verify(() {
//       datasource.getProductsByIds(
//         productIds: ids,
//       );
//     }).called(1);
//   });
// }

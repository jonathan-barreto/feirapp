import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sabor_natural_app/src/core/errors/exceptions.dart';
import 'package:sabor_natural_app/src/core/errors/failure.dart';
import 'package:sabor_natural_app/src/data/datasources/product_datasource.dart';
import 'package:sabor_natural_app/src/data/model/page_link_model.dart';
import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
import 'package:sabor_natural_app/src/data/model/product_model.dart';
import 'package:sabor_natural_app/src/data/repositories/product_repository_impl.dart';
import 'package:sabor_natural_app/src/domain/entities/parameters/order_specification_param.dart';

class MockProductDatasource extends Mock implements ProductDatasource {}

void main() {
  late ProductDatasource datasource;
  late ProductRepositoryImpl repository;

  setUp(() {
    datasource = MockProductDatasource();

    repository = ProductRepositoryImpl(
      datasource: datasource,
    );
  });

  const ProductModel productModel = ProductModel(
    id: 1,
    name: 'Abacate',
    category: 'fruta',
    unit: 'unidade',
    price: '0.99',
    image: 'abacate.png',
  );

  const PageLinkModel pageLinkModel = PageLinkModel(
    first: 'http://127.0.0.1:8000/api/products?page=1',
    next: 'http://127.0.0.1:8000/api/products?page=2',
  );

  const ProductDataModel productDataModel = ProductDataModel(
    productsModel: [productModel],
    linksModel: pageLinkModel,
  );

  const String category = 'fruta';
  const String name = 'morango';
  const List<int> ids = [1];

  OrderSpecificationParam param = OrderSpecificationParam(
    order: 'name',
    direction: 'desc',
  );

  void setUpDataSourceToReturnProductDataModel({
    required Future<ProductDataModel> Function() function,
  }) {
    when(() => function()).thenAnswer((_) async => productDataModel);
  }

  void setUpDataSourceToThrowException({
    required Future<ProductDataModel> Function() function,
  }) {
    when(() => function()).thenThrow(ServerException());
  }

  test('sholud return product data model in getAllProducts', () async {
    setUpDataSourceToReturnProductDataModel(
      function: () => datasource.getAllProducts(),
    );

    final result = await repository.getAllProducts();

    expect(result, const Right(productDataModel));

    verify(() {
      datasource.getAllProducts();
    }).called(1);
  });

  test('server failure in getAllProducts', () async {
    setUpDataSourceToThrowException(
      function: () => datasource.getAllProducts(),
    );

    final result = await repository.getAllProducts();

    expectLater(result, Left(ServerFailure()));

    verify(() {
      datasource.getAllProducts();
    }).called(1);
  });

  test('sholud return product data model in getProductsByCategory', () async {
    setUpDataSourceToReturnProductDataModel(
      function: () => datasource.getProductsByCategory(
        productCategory: category,
      ),
    );

    final result = await repository.getProductsByCategory(
      productCategory: category,
    );

    expect(result, const Right(productDataModel));

    verify(() {
      datasource.getProductsByCategory(
        productCategory: category,
      );
    }).called(1);
  });

  test('server failure in getProductsByCategory', () async {
    setUpDataSourceToThrowException(
      function: () => datasource.getProductsByCategory(
        productCategory: category,
      ),
    );

    final result = await repository.getProductsByCategory(
      productCategory: category,
    );

    expectLater(result, Left(ServerFailure()));

    verify(() {
      datasource.getProductsByCategory(
        productCategory: category,
      );
    }).called(1);
  });

  test('sholud return product data model in getProductsByIds', () async {
    setUpDataSourceToReturnProductDataModel(
      function: () => datasource.getProductsByIds(
        productIds: ids,
      ),
    );

    final result = await repository.getProductsByIds(
      productIds: ids,
    );

    expect(result, const Right(productDataModel));

    verify(() {
      datasource.getProductsByIds(
        productIds: ids,
      );
    }).called(1);
  });

  test('server failure in getProductsByIds', () async {
    setUpDataSourceToThrowException(
      function: () => datasource.getProductsByIds(
        productIds: ids,
      ),
    );

    final result = await repository.getProductsByIds(
      productIds: ids,
    );

    expectLater(result, Left(ServerFailure()));

    verify(() {
      datasource.getProductsByIds(
        productIds: ids,
      );
    }).called(1);
  });

  test('sholud return product data model in getProductsByName', () async {
    setUpDataSourceToReturnProductDataModel(
      function: () => datasource.getProductsByName(
        productName: name,
      ),
    );

    final result = await repository.getProductsByName(
      productName: name,
    );

    expect(result, const Right(productDataModel));

    verify(() {
      datasource.getProductsByName(
        productName: name,
      );
    }).called(1);
  });

  test('server failure in getProductsByName', () async {
    setUpDataSourceToThrowException(
      function: () => datasource.getProductsByName(
        productName: name,
      ),
    );

    final result = await repository.getProductsByName(
      productName: name,
    );

    expectLater(result, Left(ServerFailure()));

    verify(() {
      datasource.getProductsByName(
        productName: name,
      );
    }).called(1);
  });

  test('sholud return product data model in getProductsByOrder', () async {
    setUpDataSourceToReturnProductDataModel(
      function: () => datasource.getProductsByOrder(
        order: param.order,
        direction: param.direction,
      ),
    );

    final result = await repository.getProductsByOrder(
      order: param.order,
      direction: param.direction,
    );

    expect(result, const Right(productDataModel));

    verify(() {
      datasource.getProductsByOrder(
        order: param.order,
        direction: param.direction,
      );
    }).called(1);
  });

  test('server failure in getProductsByName', () async {
    setUpDataSourceToThrowException(
      function: () => datasource.getProductsByOrder(
        order: param.order,
        direction: param.direction,
      ),
    );

    final result = await repository.getProductsByOrder(
      order: param.order,
      direction: param.direction,
    );

    expectLater(result, Left(ServerFailure()));

    verify(() {
      datasource.getProductsByOrder(
        order: param.order,
        direction: param.direction,
      );
    }).called(1);
  });
}

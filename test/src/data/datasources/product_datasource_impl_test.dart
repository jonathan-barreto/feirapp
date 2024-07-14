// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:feirapp/src/core/errors/exceptions.dart';
// import 'package:feirapp/src/core/http_client/http_client.dart';
// import 'package:feirapp/src/data/datasources/product_datasource_impl.dart';
// import 'package:feirapp/src/data/model/page_link_model.dart';
// import 'package:feirapp/src/data/model/product_data_model.dart';
// import 'package:feirapp/src/data/model/product_model.dart';

// import '../../../mocks/product_data_model_mock.dart';

// class HttpClientMock extends Mock implements HttpClient {}

// void main() {
//   late HttpClient httpClient;
//   late ProductDatasourceImpl datasource;

//   setUp(() {
//     httpClient = HttpClientMock();

//     datasource = ProductDatasourceImpl(
//       httpClient: httpClient,
//     );
//   });

//   const String urlExpected = '/products';

//   void successMoc() {
//     when(() {
//       return httpClient.get(endpoint: any(named: 'endpoint'));
//     }).thenAnswer((invocation) async {
//       return HttpResponse(
//         data: productDataModelMock,
//         statusCode: 200,
//       );
//     });
//   }

//   test('should call the get melhod with correct url', () async {
//     successMoc();

//     await datasource.getProducts();

//     verify(() {
//       httpClient.get(endpoint: urlExpected);
//     }).called(1);
//   });

//   test('should return a ProductDataModel when is successful', () async {
//     successMoc();

//     const ProductModel productModel = ProductModel(
//       id: 1,
//       name: "Abacate",
//       category: "fruta",
//       unit: "unidade",
//       price: "0.99",
//       image: "abacate.png",
//     );

//     const PageLinkModel pageLinkModel = PageLinkModel(
//       first: 'http://127.0.0.1:8000/api/products?page=1',
//       next: 'http://127.0.0.1:8000/api/products?page=2',
//     );

//     const ProductDataModel productDataModel = ProductDataModel(
//       productsModel: [productModel],
//       linksModel: pageLinkModel,
//     );

//     final result = await datasource.getProducts();

//     expect(result, productDataModel);
//   });

//   test('should throw a ServerException whe the call is insuccessful', () async {
//     when(() {
//       return httpClient.get(endpoint: any(named: 'endpoint'));
//     }).thenAnswer((invocation) async {
//       return HttpResponse(
//         data: 'Something wnet wrong',
//         statusCode: 400,
//       );
//     });

//     final result = datasource.getProducts();

//     expect(() => result, throwsA(ServerException()));
//   });
// }

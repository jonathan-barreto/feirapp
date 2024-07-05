// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:feirapp/src/data/model/page_link_model.dart';
// import 'package:feirapp/src/domain/entities/page_link_entity.dart';

// import '../../../mocks/page_link_model_mock.dart';

// void main() {
//   const PageLinkModel pageLinkModel = PageLinkModel(
//     first: 'http://127.0.0.1:8000/api/products?page=1',
//     next: 'http://127.0.0.1:8000/api/products?page=2',
//   );

//   test('check if is a subclass of pageLinkEntity', () async {
//     expect(pageLinkModel, isA<PageLinkEntity>());
//   });

//   test('should return a valid model', () {
//     final json = jsonDecode(pageLinkModelMock);

//     final result = PageLinkModel.fromMap(json);

//     expect(result, pageLinkModel);
//   });

//   test('should return a valid map', () {
//     final Map<String, dynamic> expectMap = {
//       'first': "http://127.0.0.1:8000/api/products?page=1",
//       "next": "http://127.0.0.1:8000/api/products?page=2",
//     };

//     final Map<String, dynamic> result = pageLinkModel.toJson();

//     expect(result, expectMap);
//   });
// }

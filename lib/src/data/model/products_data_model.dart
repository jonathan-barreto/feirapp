// import 'package:feirapp/src/data/model/product_model.dart';
// import 'package:feirapp/src/domain/entities/product_data_entity.dart';

// class ProductsDataModel {
//   final List<ProductModel> products;
//   final String? nextPageUrl;

//   ProductsDataModel({
//     required this.products,
//     required this.nextPageUrl,
//   });

//   factory ProductsDataModel.fromMap(Map<String, dynamic> map) {
//     final List list = map['data'];

//     return ProductsDataModel(
//       products: list.map((e) => ProductModel.fromMap(e)).toList(),
//       nextPageUrl: map['next_page_url'],
//     );
//   }

//   ProductDataEntity toEntity() {
//     return ProductDataEntity(
//       products: products.map((e) => e.toEntity()).toList(),
//       nextPageUrl: nextPageUrl,
//     );
//   }
// }

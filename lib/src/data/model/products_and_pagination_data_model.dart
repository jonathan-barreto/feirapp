import 'package:feirapp/src/data/model/products_and_pagination_model.dart';

class ProductsAndPaginationDataModel {
  final ProductsAndPaginationModel? data;
  final String? message;

  ProductsAndPaginationDataModel({
    required this.data,
    required this.message,
  });

  factory ProductsAndPaginationDataModel.fromMap(Map<String, dynamic> map) {
    return ProductsAndPaginationDataModel(
      data: ProductsAndPaginationModel.fromMap(map['data']),
      message: map['message'],
    );
  }
}

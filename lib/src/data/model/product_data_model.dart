import 'package:feirapp/src/data/model/product_model.dart';

class ProductDataModel {
  final List<ProductModel>? data;
  final String? message;

  ProductDataModel({
    required this.data,
    required this.message,
  });

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    final List? list = map['data'];

    return ProductDataModel(
      data: list?.map((e) => ProductModel.fromMap(e)).toList(),
      message: map['message'],
    );
  }
}

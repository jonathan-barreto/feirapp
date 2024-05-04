import 'package:sabor_natural_app/src/data/model/product_data_model.dart';

abstract class ProductDatasource {
  Future<ProductDataModel> getAllProducts();

  Future<ProductDataModel> getProductsByName({required String productName});

  Future<ProductDataModel> getProductsByCategory({
    required String productCategory,
  });

  Future<ProductDataModel> getProductsByOrder({
    required String order,
    required String direction,
  });

  Future<ProductDataModel> getProductsByIds({required List<int> productIds});

  Future<ProductDataModel> getDiscountedProducts(); 

   Future<ProductDataModel> getMoreProductsByLinkUsecase({
    required String link,
  });
}

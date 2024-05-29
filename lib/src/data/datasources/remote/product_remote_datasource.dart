import 'package:sabor_natural_app/src/data/model/product_data_model.dart';
import 'package:sabor_natural_app/src/data/model/product_filter_param_model.dart';
import 'package:sabor_natural_app/src/domain/params/product_filter_param_entity.dart';

abstract class ProductRemoteDatasource {
  Future<ProductDataModel> getAllProducts({
    required ProductFilterParamModel filter,
  });

  Future<ProductDataModel> getProductById({required String id});

  Future<ProductDataModel> getProductsByIds({required List<int> productIds});

  Future<ProductDataModel> getDiscountedProducts();

  Future<ProductDataModel> getMoreProductsByLink({
    required String link,
    required ProductFilterParamEntity? params,
  });
}

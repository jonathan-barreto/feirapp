import 'package:feirapp/src/domain/params/product_filter_param.dart';

class GetProductsParam {
  String? endpoint;
  ProductsFilterParam? productsFilterParam;

  GetProductsParam({
    this.endpoint,
    this.productsFilterParam,
  });
}

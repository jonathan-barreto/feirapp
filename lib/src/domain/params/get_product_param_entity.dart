import 'package:feirapp/src/domain/params/search_product_filter_param.dart';

class GetProductParamEntity {
  String? endpoint;
  SearchProductFilterParam? searchProductFilterParam;

  GetProductParamEntity({
    this.endpoint,
    this.searchProductFilterParam,
  });
}

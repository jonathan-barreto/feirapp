import 'package:feirapp/src/domain/params/search_product_filter_param.dart';

class GetProductParam {
  String? endpoint;
  SearchProductFilterParam? searchProductFilterParam;

  GetProductParam({
    this.endpoint,
    this.searchProductFilterParam,
  });
}

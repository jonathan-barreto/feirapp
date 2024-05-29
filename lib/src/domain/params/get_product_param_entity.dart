import 'package:sabor_natural_app/src/domain/params/product_filter_param_entity.dart';

class GetProductParamEntity {
  String? endpoint;
  ProductFilterParamEntity? productFilterParamEntity;

  GetProductParamEntity({
    this.endpoint,
    this.productFilterParamEntity,
  });
}

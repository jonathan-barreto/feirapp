import 'package:feirapp/src/domain/entities/filter_entity.dart';
import 'package:feirapp/src/domain/entities/order_tile_entity.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/category_tile_entity.dart';
import 'package:feirapp/src/domain/params/get_product_param.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/search_product_filter_param.dart';
import 'package:feirapp/src/domain/usecases/get_all_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_more_products_by_link_usecase.dart';

class SearchPageController extends ChangeNotifier {
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetMoreProductsByLinkUsecase getMoreProductsByLinkUsecase;

  SearchPageController({
    required this.getAllProductsUsecase,
    required this.getMoreProductsByLinkUsecase,
  });

  // late ScrollController scrollController;
  // late TextEditingController textController;

  // late SearchProductFilterParam searchFilterParam;
  // FilterEntity? filterEntity;

  // final DebounceService debounce = DebounceServiceImpl();

  // bool hasError = false;

  // bool pageLoading = true;
  // bool productLoading = false;
  // bool loadingMoreProducts = false;

  // String? link;
  // List<ProductEntity> products = [];

  // void _showPageLoading() {
  //   pageLoading = true;
  //   notifyListeners();
  // }

  // void _hidePageLoading() {
  //   pageLoading = false;
  //   notifyListeners();
  // }

  // void _showProductLoading() {
  //   productLoading = true;
  //   notifyListeners();
  // }

  // void _hideProductLoading() {
  //   productLoading = false;
  //   notifyListeners();
  // }

  // void _showLoadingMoreProducts() {
  //   loadingMoreProducts = true;
  //   notifyListeners();
  // }

  // void _hideLoadingMoreProducts() {
  //   loadingMoreProducts = false;
  //   notifyListeners();
  // }

  Future<void> init() async {
    // _showPageLoading();

    // scrollController = ScrollController();
    // textController = TextEditingController();

    // searchFilterParam = SearchProductFilterParam();

    // scrollController.addListener(() {
    //   final position = scrollController.position;

    //   if (position.pixels == position.maxScrollExtent) {
    //     _getProductsByLink();
    //   }
    // });

    // await getAllProducts();
  }

  // String _getEndPointByUrl({required String url}) {
  //   final List<String> strings = url.split('/');
  //   return '/${strings.last}';
  // }

  // Future<void> _getProductsByLink() async {
  //   ProductDataEntity? productDataEntity;

  //   _showLoadingMoreProducts();

  //   if (link != null) {
  //     final String endPoint = _getEndPointByUrl(
  //       url: link ?? '',
  //     );

  //     final getMoreProductsParam = GetProductParam(
  //       endpoint: endPoint,
  //     );

  //     final response = await getMoreProductsByLinkUsecase.call(
  //       getMoreProductsParam,
  //     );

  //     response.fold((l) => hasError = true, (r) => productDataEntity = r);

  //     products.addAll(
  //       productDataEntity?.products ?? [],
  //     );

  //     link = productDataEntity?.link;
  //   }

  //   _hideLoadingMoreProducts();
  // }

  // String getCategorySelected(List<CategoryTileEntity> categories) {
  //   String category = '';

  //   for (int i = 0; i < categories.length; i++) {
  //     if (categories[i].isSelected) {
  //       category = categories[i].category;
  //     }
  //   }

  //   return category;
  // }

  // String getOrderSelected(List<OrderTileEntity> orders) {
  //   String order = '';

  //   for (int i = 0; i < orders.length; i++) {
  //     if (orders[i].isSelected) {
  //       order = orders[i].order;
  //     }
  //   }

  //   return order;
  // }

  // Future<void> setProductFilterParam({required FilterEntity filters}) async {
  //   final String categorySelected = getCategorySelected(
  //     filters.categories,
  //   );

  //   final String orderSelected = getOrderSelected(
  //     filters.orders,
  //   );

  //   final SearchProductFilterParam param = SearchProductFilterParam(
  //     category: categorySelected,
  //     order: orderSelected,
  //     minPrice: filters.currentRangeValues.start,
  //     maxPrice: filters.currentRangeValues.end,
  //   );

  //   searchFilterParam = param;
  //   filterEntity = filters;
  //   notifyListeners();

  //   getProductByFilter();
  // }

  // Future<void> getProducts() async {
  //   ProductDataEntity? productDataEntity;

  //   await Future.delayed(
  //     const Duration(seconds: 1),
  //   );

  //   final response = await getAllProductsUsecase.call(
  //     searchFilterParam,
  //   );

  //   response.fold((l) => hasError = true, (r) => productDataEntity = r);

  //   products = productDataEntity?.products ?? [];
  //   link = productDataEntity?.link;
  // }

  // Future<void> getAllProducts() async {
  //   _showPageLoading();

  //   await getProducts();

  //   _hidePageLoading();
  // }

  // Future<void> getProductByFilter() async {
  //   _showProductLoading();

  //   await getProducts();

  //   _hideProductLoading();
  // }

  // Future<void> searchByProductName({required String productName}) async {
  //   searchFilterParam.name = productName;

  //   debounce(() async {
  //     await getProductByFilter();
  //   });
  // }

  // void checkSearchOnPressed() {
  //   getProductByFilter();
  // }

  // void clearOnPressed() {
  //   searchFilterParam.name = '';
  //   getProductByFilter();
  // }
}

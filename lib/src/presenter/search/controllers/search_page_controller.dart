import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/category_tile_entity.dart';
import 'package:feirapp/src/domain/entities/filter_entity.dart';
import 'package:feirapp/src/domain/entities/order_tile_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/get_product_param.dart';
import 'package:feirapp/src/domain/params/product_filter_param.dart';
import 'package:feirapp/src/domain/usecases/get_products_usecase.dart';
import 'package:flutter/material.dart';

class SearchPageController extends ChangeNotifier {
  final GetProductsUsecase getProductsUsecase;

  SearchPageController({
    required this.getProductsUsecase,
  });

  late ScrollController scrollController;
  late TextEditingController textController;
  late ProductsFilterParam searchFilterParam;

  final DebounceService debounce = DebounceServiceImpl();
  final GetProductsParam getProductsParam = GetProductsParam();

  FilterEntity? filterEntity;

  bool loading = false;
  bool loadingMoreProducts = false;

  List<ProductEntity> products = [];

  void _showLoading() {
    loading = true;
    notifyListeners();
  }

  void _hideLoading() {
    loading = false;
    notifyListeners();
  }

  void _showLoadingMoreProducts() {
    loadingMoreProducts = true;
    notifyListeners();
  }

  void _hideLoadingMoreProducts() {
    loadingMoreProducts = false;
    notifyListeners();
  }

  Future<void> init() async {
    _showLoading();

    scrollController = ScrollController();
    textController = TextEditingController();
    searchFilterParam = ProductsFilterParam();

    scrollController.addListener(() {
      final position = scrollController.position;
      if (position.pixels == position.maxScrollExtent) {
        _getProductsByLink();
      }
    });

    await getProducts();
  }

  Future<void> _standardGetProducts() async {
    final result = await getProductsUsecase.call(
      getProductsParam,
    );

    result.fold((l) => null, (r) {
      products.addAll(r.products);
      getProductsParam.endpoint = _getEndPointByUrl(
        url: r.nextPageUrl ?? '',
      );
    });
  }

  Future<void> getProducts() async {
    _showLoading();

    await _standardGetProducts();

    _hideLoading();
  }

  String _getEndPointByUrl({required String url}) {
    final List<String> strings = url.split('/');
    return '/${strings.last}';
  }

  Future<void> _getProductsByLink() async {
    _showLoadingMoreProducts();

    await _standardGetProducts();

    _hideLoadingMoreProducts();
  }

  String getCategorySelected(List<CategoryTileEntity> categories) {
    String category = '';

    for (int i = 0; i < categories.length; i++) {
      if (categories[i].isSelected) {
        category = categories[i].category;
      }
    }

    return category;
  }

  String getOrderSelected(List<OrderTileEntity> orders) {
    String order = '';

    for (int i = 0; i < orders.length; i++) {
      if (orders[i].isSelected) {
        order = orders[i].order;
      }
    }

    return order;
  }

  Future<void> setProductsFilterParam({required FilterEntity filters}) async {
    final String categorySelected = getCategorySelected(
      filters.categories,
    );

    final String orderSelected = getOrderSelected(
      filters.orders,
    );

    final ProductsFilterParam param = ProductsFilterParam(
      category: categorySelected,
      order: orderSelected,
      minPrice: filters.currentRangeValues.start,
      maxPrice: filters.currentRangeValues.end,
    );

    searchFilterParam = param;
    filterEntity = filters;
    notifyListeners();

    getProductByFilter();
  }

  Future<void> getProductByFilter() async {
    _showLoading();

    await getProducts();

    _hideLoading();
  }

  Future<void> searchByProductName({required String productName}) async {
    searchFilterParam.name = productName;

    debounce(() async {
      await getProductByFilter();
    });
  }

  void checkSearchOnPressed() {
    getProductByFilter();
  }

  void clearOnPressed() {
    searchFilterParam.name = '';
    getProductByFilter();
  }
}

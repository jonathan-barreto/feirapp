import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/category_entity.dart';
import 'package:feirapp/src/domain/entities/order_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';
import 'package:feirapp/src/domain/params/product_filter_param.dart';
import 'package:feirapp/src/domain/usecases/get_more_products_by_link_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_products_usecase.dart';
import 'package:flutter/material.dart';

class SearchPageController extends ChangeNotifier {
  final GetProductsUsecase getProductsUsecase;
  final GetMoreProductsByLinkUsecase getMoreProductsByLinkUsecase;

  SearchPageController({
    required this.getProductsUsecase,
    required this.getMoreProductsByLinkUsecase,
  });

  final DebounceService debounce = DebounceServiceImpl();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  ProductsFilterParam productsFilterParam = ProductsFilterParam();
  SelectedFiltersEntity? selectedFiltersEntity;

  bool loading = false;
  bool loadingMoreProducts = false;
  bool loadingBodyProducts = false;

  List<ProductEntity> products = [];
  String? nextPageUrl;

  void _showLoading() {
    loading = true;
    notifyListeners();
  }

  void _hideLoading() {
    loading = false;
    notifyListeners();
  }

  void _showLoadingBodyProducts() {
    loadingBodyProducts = true;
    notifyListeners();
  }

  void _hideLoadingBodyProducts() {
    loadingBodyProducts = false;
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

    scrollController.addListener(() {
      final position = scrollController.position;

      if (position.pixels == position.maxScrollExtent) {
        _getProductsByLink();
      }
    });

    await getProducts();
  }

  Future<void> getProducts() async {
    _showLoading();

    final result = await getProductsUsecase(
      productsFilterParam,
    );

    result.fold((l) => null, (r) {
      products.addAll(r.products);
      nextPageUrl = r.nextPageUrl;
    });

    _hideLoading();
  }

  String _getEndPointByUrl({required String url}) {
    final List<String> strings = url.split('/');
    return '/${strings.last}';
  }

  Future<void> _getProductsByLink() async {
    _showLoadingMoreProducts();

    final String url = _getEndPointByUrl(
      url: nextPageUrl ?? '',
    );

    final result = await getMoreProductsByLinkUsecase(url);

    result.fold((l) => null, (r) {
      products.addAll(r.products);
      nextPageUrl = r.nextPageUrl;
    });

    _hideLoadingMoreProducts();
  }

  String getCategorySelected(List<CategoryEntity> categories) {
    String category = '';

    for (int i = 0; i < categories.length; i++) {
      if (categories[i].isSelected) {
        category = categories[i].category;
      }
    }

    return category;
  }

  String getOrderSelected(List<OrderEntity> orders) {
    String order = '';

    for (int i = 0; i < orders.length; i++) {
      if (orders[i].isSelected) {
        order = orders[i].order;
      }
    }

    return order;
  }

  Future<void> setProductsFilterParam({
    required SelectedFiltersEntity filters,
  }) async {
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

    productsFilterParam = param;

    selectedFiltersEntity = filters;
    notifyListeners();

    getProductByFilter();
  }

  Future<void> getProductByFilter() async {
    _showLoadingBodyProducts();

    final result = await getProductsUsecase(
      productsFilterParam,
    );

    products = [];

    result.fold((l) => null, (r) {
      products.addAll(r.products);
      nextPageUrl = r.nextPageUrl;
    });

    _hideLoadingBodyProducts();
  }

  Future<void> searchByProductName({required String productName}) async {
    productsFilterParam.name = productName;

    debounce(() async {
      await getProductByFilter();
    });
  }

  void checkSearchOnPressed() {
    getProductByFilter();
  }

  void clearOnPressed() {
    productsFilterParam.name = '';
    getProductByFilter();
  }
}

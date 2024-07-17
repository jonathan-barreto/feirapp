import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/category_tile_entity.dart';
import 'package:feirapp/src/domain/entities/order_tile_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/entities/selected_filters_entity.dart';
import 'package:feirapp/src/domain/params/get_product_param.dart';
import 'package:feirapp/src/domain/params/product_filter_param.dart';
import 'package:feirapp/src/domain/usecases/get_products_usecase.dart';
import 'package:flutter/material.dart';

class SearchPageController extends ChangeNotifier {
  final GetProductsUsecase getProductsUsecase;

  SearchPageController({
    required this.getProductsUsecase,
  });

  final DebounceService debounce = DebounceServiceImpl();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final GetProductsParam getProductsParam = GetProductsParam();

  ProductsFilterParam searchFilterParam = ProductsFilterParam();
  SelectedFiltersEntity? selectedFiltersEntity;

  bool loading = false;
  bool loadingMoreProducts = false;
  bool loadingBodyProducts = false;

  List<ProductEntity> products = [];

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

    searchFilterParam = param;
    selectedFiltersEntity = filters;
    notifyListeners();

    getProductByFilter();
  }

  Future<void> getProductByFilter() async {
    _showLoadingBodyProducts();
    
    await _standardGetProducts();

    _hideLoadingBodyProducts();
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

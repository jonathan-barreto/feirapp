import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/enums/filter_order_enum.dart';
import 'package:feirapp/src/core/shared/enums/product_category_enum.dart';
import 'package:feirapp/src/core/shared/services/debounce_service.dart';
import 'package:feirapp/src/core/shared/services/debounce_service_impl.dart';
import 'package:feirapp/src/domain/entities/category_tile_entity.dart';
import 'package:feirapp/src/domain/params/get_product_param_entity.dart';
import 'package:feirapp/src/domain/entities/page_link_entity.dart';
import 'package:feirapp/src/domain/entities/product_data_entity.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/domain/params/product_filter_param_entity.dart';
import 'package:feirapp/src/domain/usecases/get_all_products_usecase.dart';
import 'package:feirapp/src/domain/usecases/get_more_products_by_link_usecase.dart';
import 'package:feirapp/src/presenter/search/pages/search_filter_page.dart';

class SearchPageController extends ChangeNotifier {
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetMoreProductsByLinkUsecase getMoreProductsByLinkUsecase;

  SearchPageController({
    required this.getAllProductsUsecase,
    required this.getMoreProductsByLinkUsecase,
  });

  final DebounceService debounce = DebounceServiceImpl();

  late ScrollController scrollController;
  late TextEditingController textController;
  late ProductFilterParamEntity productFilterParamEntity;

  final List<CategoryTileEntity> categories = [
    CategoryTileEntity(
      title: 'Todos',
      category: ProductCategoryEnum.todos,
      isSelected: true,
    ),
    CategoryTileEntity(
      title: 'Frutas',
      category: ProductCategoryEnum.fruta,
    ),
    CategoryTileEntity(
      title: 'Verduras',
      category: ProductCategoryEnum.verdura,
    ),
    CategoryTileEntity(
      title: 'Vegetais',
      category: ProductCategoryEnum.vegetal,
    ),
    CategoryTileEntity(
      title: 'Temperos',
      category: ProductCategoryEnum.tempero,
    ),
  ];

  FilterOrderEnum? order;

  bool hasError = false;

  bool pageLoading = true;
  bool productLoading = false;
  bool loadingMoreProducts = false;

  PageLinkEntity? links;
  List<ProductEntity> products = [];

  void _showPageLoading() {
    pageLoading = true;
    notifyListeners();
  }

  void _hidePageLoading() {
    pageLoading = false;
    notifyListeners();
  }

  void _showProductLoading() {
    productLoading = true;
    notifyListeners();
  }

  void _hideProductLoading() {
    productLoading = false;
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
    _showPageLoading();

    scrollController = ScrollController();
    textController = TextEditingController();

    productFilterParamEntity = ProductFilterParamEntity();

    scrollController.addListener(() {
      final position = scrollController.position;

      if (position.pixels == position.maxScrollExtent) {
        _getProductsByLink();
      }
    });

    await getAllProducts();
  }

  String _getEndPointByUrl({required String url}) {
    final List<String> strings = url.split('/');
    return '/${strings.last}';
  }

  Future<void> _getProductsByLink() async {
    ProductDataEntity? productDataEntity;

    _showLoadingMoreProducts();

    if (links?.next != null) {
      final String endPoint = _getEndPointByUrl(
        url: links?.next ?? '',
      );

      final getMoreProductsParam = GetProductParamEntity(
        endpoint: endPoint,
      );

      final response = await getMoreProductsByLinkUsecase.call(
        getMoreProductsParam,
      );

      response.fold((l) => hasError = true, (r) => productDataEntity = r);

      products.addAll(
        productDataEntity?.products ?? [],
      );

      links = productDataEntity?.links;
    }

    _hideLoadingMoreProducts();
  }

  Future<void> getProducts() async {
    ProductDataEntity? productDataEntity;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    final response = await getAllProductsUsecase.call(
      productFilterParamEntity,
    );

    response.fold((l) => hasError = true, (r) => productDataEntity = r);

    products = productDataEntity?.products ?? [];
    links = productDataEntity?.links;
  }

  Future<void> getAllProducts() async {
    _showPageLoading();

    await getProducts();

    _hidePageLoading();
  }

  Future<void> getProductByFilter() async {
    _showProductLoading();

    await getProducts();

    _hideProductLoading();
  }

  void searchByProductName({required String productName}) {
    productFilterParamEntity.name = productName;
    debounce(getProductByFilter);
  }

  void _setCategoryInFilter({required ProductCategoryEnum? value}) {
    final Map<ProductCategoryEnum, String> filterMap = {
      ProductCategoryEnum.todos: '',
      ProductCategoryEnum.vegetal: 'vegetal',
      ProductCategoryEnum.verdura: 'verdura',
      ProductCategoryEnum.tempero: 'tempero',
      ProductCategoryEnum.fruta: 'fruta',
    };

    if (value != null) {
      productFilterParamEntity.category = filterMap[value];
    }
  }

  void _setRangePriceInFilter({required RangeValues values}) {
    productFilterParamEntity.minPrice = values.start;
    productFilterParamEntity.maxPrice = values.end;
  }

  void _checkSearchOnPressed() {
    getProductByFilter();
  }

  void _setOrder({required FilterOrderEnum value}) {
    final Map<FilterOrderEnum, String> mapping = {
      FilterOrderEnum.asc: 'asc',
      FilterOrderEnum.desc: 'desc',
    };

    order = value;
    productFilterParamEntity.order = mapping[value];
  }

  void _clearFilters() {
    for (int index = 0; index < categories.length; index++) {
      if (index == 0) {
        categories[index].isSelected = true;
      } else {
        categories[index].isSelected = false;
      }
    }

    order = null;

    productFilterParamEntity.clear();

    getAllProducts();
  }

  Future<void> showFilterOptions({required BuildContext context}) async {
    await SearchFilterPage(
      parentContext: context,
      categories: categories,
      start: productFilterParamEntity.minPrice,
      end: productFilterParamEntity.maxPrice,
      searchOnPressed: _checkSearchOnPressed,
      radioChange: (value) => _setCategoryInFilter(value: value),
      orderOnChange: (value) => _setOrder(value: value),
      rangeSliderChange: (values) => _setRangePriceInFilter(values: values),
      order: order,
      clearFilters: _clearFilters,
    ).show();
  }
}

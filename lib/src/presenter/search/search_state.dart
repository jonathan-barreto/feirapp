import 'package:sabor_natural_app/src/domain/entities/page_link_entity.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';

class SearchState {
  final List<ProductEntity> products;
  final bool loadingMoreProducts;
  final PageLinkEntity? links;

  SearchState({
    required this.products,
    this.loadingMoreProducts = false,
    this.links,
  });

  factory SearchState.init() {
    return SearchState(
      products: [],
    );
  }

  factory SearchState.getProducts({
    required List<ProductEntity> products,
    PageLinkEntity? links,
  }) {
    return SearchState(
      products: products,
      links: links,
    );
  }

  SearchState copyWith({
    List<ProductEntity>? products,
    bool? loadingMoreProducts,
    PageLinkEntity? links,
  }) {
    return SearchState(
      products: products ?? this.products,
      loadingMoreProducts: loadingMoreProducts ?? this.loadingMoreProducts,
      links: links ?? this.links,
    );
  }
}

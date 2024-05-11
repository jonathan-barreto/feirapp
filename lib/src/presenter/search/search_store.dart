import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sabor_natural_app/src/core/shared/state/raw_state.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/custom_bottom_modal_widget.dart';
import 'package:sabor_natural_app/src/domain/entities/product_data_entity.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_all_products_usecase.dart';
import 'package:sabor_natural_app/src/domain/usecases/get_more_products_by_link_usecase.dart';
import 'package:sabor_natural_app/src/presenter/search/search_state.dart';

class SearchStore extends ValueNotifier<RawState> {
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetMoreProductsByLinkUsecase getMoreProductsByLinkUsecase;

  SearchStore({
    required this.getAllProductsUsecase,
    required this.getMoreProductsByLinkUsecase,
  }) : super(const IdleState());

  late final ScrollController scrollController;
  late final TextEditingController textController;

  void init() {
    scrollController = ScrollController();
    textController = TextEditingController();

    scrollController.addListener(() {
      final position = scrollController.position;

      if (position.pixels == position.maxScrollExtent) {
        _getProductsByLink();
      }
    });

    value = SuccessState<SearchState>(
      output: SearchState.init(),
    );
  }

  String _getEndPointByUrl({required String url}) {
    final List<String> strings = url.split('/');
    return '/${strings.last}';
  }

  Future<void> _getProductsByLink() async {
    ProductDataEntity? productDataEntity;
    bool hasError = false;

    if (value is SuccessState<SearchState>) {
      final state = value as SuccessState<SearchState>;

      value = SuccessState<SearchState>(
        output: state.output.copyWith(
          loadingMoreProducts: true,
        ),
      );

      if (state.output.links?.next != null) {
        final String endPoint = _getEndPointByUrl(
          url: state.output.links?.next ?? '',
        );

        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );

        final response = await getMoreProductsByLinkUsecase.call(
          endPoint,
        );

        response.fold((l) => hasError = true, (r) => productDataEntity = r);

        if (hasError == true) {
          value = const ErrorState(message: 'deu erro');
        } else {
          final responseProducts = productDataEntity?.products ?? [];

          final products = [...state.output.products, ...responseProducts];

          value = SuccessState<SearchState>(
            output: state.output.copyWith(
              products: products,
              links: productDataEntity?.links,
              loadingMoreProducts: false,
            ),
          );
        }
      } else {
        value = SuccessState<SearchState>(
          output: state.output.copyWith(
            loadingMoreProducts: false,
          ),
        );
      }
    }
  }

  Future<void> getAllProducts() async {
    ProductDataEntity? productDataEntity;
    bool hasError = false;

    value = const LoadingState();

    await Future.delayed(
      const Duration(seconds: 1),
    );

    value = SuccessState<SearchState>(
      output: SearchState.getProducts(
        products: [],
      ),
    );

    // final NoParams noParams = NoParams();

    // final response = await getAllProductsUsecase.call(
    //   noParams,
    // );

    // response.fold((l) => hasError = true, (r) => productDataEntity = r);

    // if (hasError == true) {
    //   value = const ErrorState(message: 'deu erro');
    // } else {
    //   value = SuccessState<SearchState>(
    //     output: SearchState.getProducts(
    //       products: productDataEntity?.products ?? [],
    //       links: productDataEntity?.links,
    //     ),
    //   );
    // }
  }

  Future<void> showFilterOptions({required BuildContext context}) async {
    await FilterBottomModalWidget(
      parentContext: context,
    ).show();
  }

  // String _sanitizeText({required String text}) {
  //   String textoSemAcentos = text
  //       .replaceAll(RegExp(r'[áàâãä]', caseSensitive: false), 'a')
  //       .replaceAll(RegExp(r'[éèêë]', caseSensitive: false), 'e')
  //       .replaceAll(RegExp(r'[íìîï]', caseSensitive: false), 'i')
  //       .replaceAll(RegExp(r'[óòôõö]', caseSensitive: false), 'o')
  //       .replaceAll(RegExp(r'[úùûü]', caseSensitive: false), 'u')
  //       .replaceAll(RegExp(r'[ç]', caseSensitive: false), 'c');

  //   final String textoLimpo = textoSemAcentos.replaceAll(
  //     RegExp(r'[^a-zA-Z]'),
  //     '',
  //   );

  //   return textoLimpo.toLowerCase();
  // }
}

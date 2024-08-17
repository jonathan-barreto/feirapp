import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/core/shared/widgets/feedback_widget.dart';
import 'package:feirapp/src/core/shared/widgets/horizontal_product_card_widget.dart';
import 'package:feirapp/src/core/shared/widgets/input_and_filter_button_widget.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/presenter/favorites/widgets/favorite_card_options_widget.dart';
import 'package:flutter/material.dart';

class FavoritesPageContentWidget extends StatelessWidget {
  final List<ProductEntity> products;
  final bool filterLoading;
  final void Function(String) openDialogRemove;
  final VoidCallback openFilter;

  const FavoritesPageContentWidget({
    super.key,
    required this.products,
    required this.filterLoading,
    required this.openDialogRemove,
    required this.openFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              InputAndFilterButtonWidget(
                openFilterOnPressed: openFilter,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: AppStyleValues.small,
              ),
            ],
          ),
          SliverVisibility(
            visible: filterLoading,
            sliver: const SliverFillRemaining(
              child: StandardLoadingWidget(),
            ),
          ),
          SliverVisibility(
            visible: filterLoading == false && products.isEmpty,
            sliver: const SliverFillRemaining(
              child: FeedbackWidget(
                feedbackMessage: 'Nenhum produdo foi encontrado.',
              ),
            ),
          ),
          SliverVisibility(
            visible: filterLoading == false && products.isNotEmpty,
            sliver: SliverList.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final ProductEntity product = products[index];

                return HorizontalProductCardWidget(
                  product: product,
                  optionsWidget: FavoriteCardOptionsWidget(
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

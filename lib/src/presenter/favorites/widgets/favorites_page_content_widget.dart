import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:feirapp/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:feirapp/src/core/shared/widgets/feedback_widget.dart';
import 'package:feirapp/src/core/shared/widgets/input/widget/input_widget.dart';
import 'package:feirapp/src/domain/entities/product_entity.dart';
import 'package:feirapp/src/presenter/favorites/widgets/favorite_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppStyleValues.small,
                  vertical: AppStyleValues.normal,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      AppStyleValues.normal,
                    ),
                    bottomRight: Radius.circular(
                      AppStyleValues.normal,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InputWidget(
                        onChanged: (String? value) {},
                      ),
                    ),
                    const SizedBox(
                      width: AppStyleValues.small,
                    ),
                    GestureDetector(
                      onTap: openFilter,
                      child: Container(
                        width: AppStyleValues.extraLarge * 1.5,
                        height: AppStyleValues.extraLarge * 1.5,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(
                            AppStyleValues.normal,
                          ),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.list,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                feedbackMessage: 'Nenhum produco foi encontrado.',
              ),
            ),
          ),
          SliverVisibility(
            visible: filterLoading == false && products.isNotEmpty,
            sliver: SliverList.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final ProductEntity product = products[index];

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppStyleValues.small,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: SwipeActionCell(
                      key: ObjectKey(product),
                      trailingActions: <SwipeAction>[
                        SwipeAction(
                          onTap: (CompletionHandler handler) async {
                            openDialogRemove(
                              '${product.id}',
                            );
                          },
                          backgroundRadius: AppStyleValues.normal,
                          color: Colors.redAccent,
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                      child: FavoriteContainerWidget(
                        product: product,
                      ),
                    ),
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

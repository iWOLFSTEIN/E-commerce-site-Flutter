import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_item/selected_item.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/category_with_selectable_items.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/item_detail_page/colors_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedItemCubit, SelectedItemCubitState>(
      builder: (context, state) {
        if (state is! SelectedItemCubitDone) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final headerImage = state.product?.image ?? '';
        final title = state.product?.title ?? '';
        dynamic rate = state.product?.rating.rate ?? 0.0;
        final rating = rate.round();
        final ratingCount = state.product?.rating.count ?? 0;
        final price = state.product?.price;

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 1024,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      itemImages(headerImage),
                      const SizedBox(
                        width: Spacing.standard * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          productTitle(title),
                          const SizedBox(
                            height: Spacing.regular,
                          ),
                          productRating(rating, ratingCount),
                          const SizedBox(
                            height: Spacing.standard,
                          ),
                          productPrice(price),
                          const SizedBox(
                            height: Spacing.standard,
                          ),
                          ColorsSelection(
                            colors: [
                              Colors.red.withOpacity(0.4),
                              Colors.blue.withOpacity(0.4),
                              Colors.green.withOpacity(0.4)
                            ],
                            selectedColor: Colors.red.withOpacity(0.4),
                          ),
                          const SizedBox(
                            height: Spacing.standard,
                          ),
                          CategoryWithSelectableItems(
                            title: ViewConstants.size,
                            onSelected: (selectedItemsList) {
                              print(selectedItemsList);
                            },
                            items: const [
                              ViewConstants.small,
                              ViewConstants.medium,
                              ViewConstants.large,
                              ViewConstants.xlarge,
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Text productPrice(double? price) {
    return Text(
      '\$$price',
      style: const TextStyle(
          fontSize: FontSize.xxlarge * 2.25, fontWeight: FontWeight.w500),
    );
  }

  Row productRating(rating, int ratingCount) {
    return Row(
      children: [
        Wrap(
          spacing: Spacing.xsmall,
          children: [
            for (int i = 1; i <= 5; i++)
              Icon(
                i <= rating ? Icons.star : Icons.star_border,
                color: i <= rating ? AppColors.highlight : AppColors.border,
                size: 17,
              )
          ],
        ),
        const SizedBox(
          width: Spacing.medium,
        ),
        Text(
          '$ratingCount ${ViewConstants.reviews.toLowerCase()}',
          style: const TextStyle(
              color: AppColors.secondary, fontSize: FontSize.regular),
        )
      ],
    );
  }

  Text productTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(fontSize: FontSize.heading),
    );
  }

  Widget itemImages(String imageUrl) {
    if (imageUrl.isEmpty) return Container();
    return Column(
      children: [
        headerImage(imageUrl),
        const SizedBox(
          height: Spacing.standard,
        ),
        Row(
          children: [
            subImage(imageUrl),
            const SizedBox(
              width: Spacing.normal,
            ),
            subImage(imageUrl),
            const SizedBox(
              width: Spacing.normal,
            ),
            subImage(imageUrl),
            const SizedBox(
              width: Spacing.normal,
            ),
            morePics(),
          ],
        ),
      ],
    );
  }

  Container subImage(String imageUrl) {
    return Container(
      height: 95,
      width: 95,
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container headerImage(String imageUrl) {
    return Container(
      height: 404,
      width: 404,
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget morePics() {
    const remainingPicsCount = 4;
    return Container(
      height: 95,
      width: 95,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
      ),
      child: const Text(
        '+$remainingPicsCount more',
        style: TextStyle(
          fontSize: FontSize.medium,
        ),
      ),
    );
  }
}

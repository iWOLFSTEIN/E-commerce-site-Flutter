import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_item/selected_item.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/category_with_selectable_items.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/item_detail_page/colors_selection.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/item_detail_page/review_and_discussion_section.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedItemCubit, SelectedItemCubitState>(
      builder: (context, state) {
        // if (state is! SelectedItemCubitDone) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }

        final headerImage = state.product?.image ??
            'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
        final title = state.product?.title ?? 'Cute White Kitten';
        dynamic rate = state.product?.rating.rate ?? 0.0;
        final rating = rate.round();
        final ratingCount = state.product?.rating.count ?? 0;
        final price = state.product?.price ?? 0.0;

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: Spacing.standard * 3,
                    children: [
                      imagesSection(headerImage),
                      const SizedBox(
                        width: Spacing.standard * 3,
                      ),
                      addToCartSection(title, rating, ratingCount, price),
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.standard * 2,
                  ),
                  Wrap(
                    runSpacing: Spacing.standard * 3,
                    children: [
                      const ReviewAndDiscussionSection(),
                      const SizedBox(
                        width: Spacing.standard * 3,
                      ),
                      advertisementBanner()
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Container advertisementBanner() {
    bannerText() => const SizedBox(
          width: 180,
          child: Wrap(
            children: [
              Text(
                'Popular brands with discount over 25%',
                style: TextStyle(
                    fontSize: FontSize.heading, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );

    viewMoreButton() => Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Spacing.standard, vertical: Spacing.normal),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: const Text(ViewConstants.viewMore),
        );

    bannerIcons(iconData, [color = AppColors.primary, size = 28]) => Icon(
          iconData,
          color: color,
          size: size,
        );

    return Container(
      height: 330,
      width: 300,
      padding: const EdgeInsets.all(Spacing.standard * 1.5),
      decoration: const BoxDecoration(
          color: AppColors.banner,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bannerText(),
              const SizedBox(
                height: Spacing.standard,
              ),
              Wrap(
                spacing: Spacing.xsmall,
                children: [
                  bannerIcons(Icons.account_tree_rounded, Colors.blue),
                  bannerIcons(Icons.access_time_filled, Colors.red),
                  bannerIcons(Icons.add_business, Colors.green),
                  bannerIcons(Icons.account_balance_sharp, Colors.purple),
                ],
              ),
            ],
          ),
          Column(
            children: [
              viewMoreButton(),
              const SizedBox(
                height: Spacing.standard,
              )
            ],
          ),
        ],
      ),
    );
  }

  Row addToCartSection(String title, rating, int ratingCount, double price) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productTitle(title),
            const SizedBox(
              height: Spacing.regular,
            ),
            RatingWidget(rating: rating, ratingCount: ratingCount),
            const SizedBox(
              height: Spacing.xxlarge + 2,
            ),
            productPrice(price),
            const SizedBox(
              height: Spacing.xxlarge + 2,
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
              height: Spacing.xxlarge,
            ),
            CategoryWithSelectableItems(
              title: ViewConstants.size,
              onSelected: (selectedItemsList) {},
              items: const [
                ViewConstants.small,
                ViewConstants.medium,
                ViewConstants.large,
                ViewConstants.xlarge,
              ],
            ),
            const SizedBox(
              height: Spacing.xxlarge * 2,
            ),
            addToCartButton(),
            const SizedBox(
              height: Spacing.normal,
            ),
            freeDeliveryText(),
            const SizedBox(
              height: Spacing.xxlarge,
            ),
            characteristicsTile(),
            paymentAndDeliveryTile()
          ],
        ),
      ],
    );
  }

  Row freeDeliveryText() {
    return const Row(
      children: [
        Icon(
          Icons.delivery_dining_outlined,
          color: AppColors.primary,
          size: 16,
        ),
        SizedBox(
          width: Spacing.small,
        ),
        Text(
          '${ViewConstants.freeDeliveryOnTheOrderOver}50.0',
          style: TextStyle(fontSize: FontSize.medium),
        )
      ],
    );
  }

  Widget characteristicsTile() {
    final data = [
      {'Brand': 'Style & Runes'},
      {'Collection': 'Winter 2024'},
      {'Item no.': '9324802'},
      {'Material': 'N/A'},
    ];

    return expandableTile(ViewConstants.characteristics, data);
  }

  Widget paymentAndDeliveryTile() {
    final data = [
      {'Address': '12 street, main road, New York, USA'},
      {'Payment method': 'Cash on delivery'},
      {'Contact no.': '+12 232 1248021'},
    ];

    return expandableTile(ViewConstants.paymentAndDelivery, data);
  }

  Widget expandableTile(title, List data) {
    tileItem(name, value) => Padding(
          padding: const EdgeInsets.only(bottom: Spacing.normal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: AppColors.secondary, fontSize: FontSize.medium),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: FontSize.medium),
              )
            ],
          ),
        );
    return SizedBox(
      width: 404,
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        shape: InputBorder.none,
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: FontSize.large),
        ),
        children: data
            .map((item) => tileItem(item.keys.first, item.values.first))
            .toList(),
      ),
    );
  }

  Row imagesSection(String headerImage) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        itemImages(headerImage),
      ],
    );
  }

  Widget addToCartButton() {
    return SizedBox(
      width: 404,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: Spacing.regular),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.white,
                    size: 16,
                  ),
                  const SizedBox(
                    width: Spacing.normal,
                  ),
                  Text(
                    ViewConstants.addToCart.toUpperCase(),
                    style: const TextStyle(color: AppColors.white),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: Spacing.normal,
          ),
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: Spacing.regular),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primary)),
            child: const Icon(
              Icons.favorite_border_outlined,
              color: AppColors.primary,
              size: 18,
            ),
          )
        ],
      ),
    );
  }

  Text productPrice(double? price) {
    return Text(
      '\$$price',
      style: const TextStyle(
          fontSize: FontSize.xxlarge * 2.25, fontWeight: FontWeight.w500),
    );
  }

  Widget productTitle(String title) {
    return SizedBox(
      width: 404,
      child: Wrap(
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: FontSize.heading),
          ),
        ],
      ),
    );
  }

  Widget itemImages(String imageUrl) {
    if (imageUrl.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        headerImage(imageUrl),
        const SizedBox(
          height: Spacing.standard,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
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

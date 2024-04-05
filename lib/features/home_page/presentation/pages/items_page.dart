import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_item/selected_item.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/items_page/sort_by_button.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/items_page/filters_tile_item.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/decorated_text.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/items_page/filter_list_items.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/items_page/items_page_heading.dart';
import 'package:e_commerce_site/core/constants/app_assets.dart';
import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/app_icons.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({
    super.key,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  int currentPageNumber = 1;
  int totalPages = 10;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const ItemsPageHeading(),
            const SizedBox(
              height: Spacing.standard * 1.75,
            ),
            filtersTile(context),
            const SizedBox(
              height: Spacing.normal,
            ),
            const Divider(
              color: AppColors.border,
            ),
            allShoppingItems(state.products),
            // const SizedBox(
            //   height: Spacing.standard * 3,
            // ),
            // PaginationControls(
            //     currentPage: currentPageNumber,
            //     totalPages: totalPages,
            //     onNextPressed: () {
            //       if (currentPageNumber < totalPages) {
            //         currentPageNumber++;
            //         setState(() {});
            //       }
            //     },
            //     onPrevPressed: () {
            //       if (currentPageNumber > 1) {
            //         currentPageNumber--;
            //         setState(() {});
            //       }
            //     },
            //     onPageSelected: (pageNumber) {
            //       currentPageNumber = pageNumber;
            //       setState(() {});
            //     })
          ],
        );
      },
    );
  }

  Container allShoppingItems(products) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Wrap(
            children: [
              for (ProductEntity product in products) shoppingItem(product),
            ],
          ),
          const SizedBox(
            height: Spacing.standard * 3,
          ),
          const DecoratedText(text: ViewConstants.showMore),
        ],
      ),
    );
  }

  Padding shoppingItem(ProductEntity product, {isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.only(
          right: Spacing.standard,
          left: Spacing.standard,
          bottom: Spacing.standard,
          top: Spacing.standard),
      child: InkWell(
        hoverColor: AppColors.background,
        onTap: () {
          context.read<SelectedItemCubit>().setProduct(product);
          context.goNamed('itemDetailPage');
        },
        child: SizedBox(
          height: isHighlight ? 600 : 400,
          width: isHighlight ? 450 : 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image,
                height: isHighlight ? 528 : 328,
                width: isHighlight ? 450 : 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: Spacing.medium,
              ),
              SizedBox(
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: isHighlight
                              ? FontSize.medium * 1.5
                              : FontSize.medium,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${product.price}\$',
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: isHighlight
                              ? FontSize.regular * 1.5
                              : FontSize.medium,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget filtersTile(BuildContext context) {
    final filtersList = [
      "Engine",
      "20\$ - 40\$",
      "Size M",
      "Engine",
      "20\$ - 40\$",
      "Size M",
      "Engine",
      "20\$ - 40\$",
      "Size M",
    ];

    List<Widget> filtersWidgetList = [filtersButton(filtersList.length)];
    for (String filter in filtersList) {
      final widget = filterItem(filter);
      filtersWidgetList.add(widget);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            children: filtersWidgetList,
          ),
        ),
        SizedBox(
          width: Responsive.width(context) * 2,
        ),
        const Row(
          children: [SortByButton()],
        )
      ],
    );
  }

  Widget filterItem(String text) {
    return FiltersTileItem(
        child: Row(
      children: [
        Text(
          text.toUpperCase(),
          style: const TextStyle(
              color: AppColors.primary, fontSize: FontSize.regular),
        ),
        const SizedBox(
          width: Spacing.normal,
        ),
        Image.asset(
          "${AppAssets.icons}/${AppIcons.cross}",
          height: 20,
          width: 20,
        )
      ],
    ));
  }

  Widget filtersButton(int filtersCount) {
    return Builder(builder: (context) {
      return FiltersTileItem(
        showDarkColor: true,
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const FilterListItems(),
            onPop: () {},
            direction: PopoverDirection.bottom,
            width: 400,
            height: 450,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
        child: Row(
          children: [
            Text(
              ViewConstants.filters.toUpperCase(),
              style: const TextStyle(
                  color: AppColors.white, fontSize: FontSize.regular),
            ),
            const SizedBox(
              width: Spacing.normal,
            ),
            CircleAvatar(
              backgroundColor: AppColors.background,
              radius: 10,
              child: Center(
                child: Text(
                  '$filtersCount',
                  style: const TextStyle(
                      color: AppColors.primary, fontSize: FontSize.regular),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

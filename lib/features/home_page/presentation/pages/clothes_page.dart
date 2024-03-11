import 'package:e_commerce_site/presentation/widgets/custom_ink_well.dart';
import 'package:e_commerce_site/presentation/widgets/decorated_text.dart';
import 'package:e_commerce_site/presentation/widgets/pagination_controls.dart';
import 'package:e_commerce_site/shared/constants/app_assets.dart';
import 'package:e_commerce_site/shared/constants/app_colors.dart';
import 'package:e_commerce_site/shared/constants/app_icons.dart';
import 'package:e_commerce_site/shared/constants/font_size.dart';
import 'package:e_commerce_site/shared/constants/spacing.dart';
import 'package:e_commerce_site/shared/constants/view_constants.dart';
import 'package:e_commerce_site/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class ClothesPage extends StatefulWidget {
  const ClothesPage({super.key});

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  int currentPageNumber = 1;
  int totalPages = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pageHeading(),
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
        allShoppingItems(),
        const SizedBox(
          height: Spacing.standard * 1.5,
        ),
        const DecoratedText(text: ViewConstants.showMore),
        const SizedBox(
          height: Spacing.standard * 3,
        ),
        PaginationControls(
            currentPage: currentPageNumber,
            totalPages: totalPages,
            onNextPressed: () {
              if (currentPageNumber < totalPages) {
                currentPageNumber++;
                setState(() {});
              }
            },
            onPrevPressed: () {
              if (currentPageNumber > 1) {
                currentPageNumber--;
                setState(() {});
              }
            },
            onPageSelected: (pageNumber) {
              currentPageNumber = pageNumber;
              setState(() {});
            })
      ],
    );
  }

  Container allShoppingItems() {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        children: [
          for (int i = 0; i < 18; i++)
            shoppingItem(isHighlight: i == 5 ? true : false)
        ],
      ),
    );
  }

  Padding shoppingItem({isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.only(
          right: Spacing.standard,
          left: Spacing.standard,
          bottom: Spacing.standard,
          top: Spacing.standard),
      child: InkWell(
        hoverColor: AppColors.background,
        onTap: () {},
        child: SizedBox(
          height: isHighlight ? 600 : 400,
          width: isHighlight ? 450 : 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://d2z0lqci37nukm.cloudfront.net/media/catalog/product/cache/59d1d247a0855e7654a8594881fa0c03/g/r/grey-herringbone-button-down-formal-shirt_1_7vxtlq5kxsuv6uur.jpg',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mens White Dress Shirt with Full Sleeves',
                      style: TextStyle(
                          fontSize: isHighlight
                              ? FontSize.medium * 1.5
                              : FontSize.medium,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '1000\$',
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: isHighlight
                              ? FontSize.regular * 1.5
                              : FontSize.regular,
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
        Row(
          children: [sortByItem()],
        )
      ],
    );
  }

  Widget sortByItem() {
    return filtersTileItem(
        showDarkColor: true,
        child: Row(
          children: [
            Text(
              ViewConstants.sortBy.toUpperCase(),
              style: const TextStyle(
                  color: AppColors.white, fontSize: FontSize.regular),
            ),
            const SizedBox(
              width: Spacing.normal,
            ),
            const Icon(
              Icons.add,
              color: AppColors.white,
              size: 20,
            )
          ],
        ));
  }

  Widget filterItem(String text) {
    return filtersTileItem(
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
      return filtersTileItem(
        showDarkColor: true,
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
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

  Widget filtersTileItem(
      {required Widget child, Function()? onTap, bool showDarkColor = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              right: Spacing.medium, bottom: Spacing.medium),
          child: InkWell(
            onTap: onTap,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.regular, vertical: Spacing.small),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    color: showDarkColor ? AppColors.primary : null,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: child),
          ),
        ),
      ],
    );
  }

  Wrap pageHeading() {
    return Wrap(
      children: [
        Text(
          "Men's Clothes".toUpperCase(),
          style: const TextStyle(fontSize: FontSize.large * 4, height: 1),
        ),
        SizedBox(
          width: Responsive.width(context) * 0.75,
        ),
        Text(
          "150 ${ViewConstants.results}".toUpperCase(),
          style: const TextStyle(fontSize: FontSize.large),
        ),
      ],
    );
  }
}

class ListItems extends StatefulWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  String selectedCategoryValue = '';
  String selectedSizeValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.standard * 2, horizontal: Spacing.standard),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(text: ViewConstants.priceRange),
              const SizedBox(
                height: Spacing.normal,
              ),
              Row(
                children: [
                  textField(
                      hintText: ViewConstants.min,
                      initialValue: ViewConstants.minInitialValue),
                  const SizedBox(
                    width: Spacing.normal,
                  ),
                  textField(
                      hintText: ViewConstants.max,
                      initialValue: ViewConstants.maxInitialValue),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: Spacing.standard,
          ),
          title(text: ViewConstants.category),
          const SizedBox(
            height: Spacing.normal,
          ),
          SizedBox(
            width: 368,
            child: Wrap(
              spacing: Spacing.normal,
              runSpacing: Spacing.normal,
              children: [
                categoryItem(ViewConstants.jackets),
                categoryItem(ViewConstants.shirts),
                categoryItem(ViewConstants.jeans),
                categoryItem(ViewConstants.suits),
                categoryItem(ViewConstants.sleepWears),
                categoryItem(ViewConstants.accessories),
              ],
            ),
          ),
          const SizedBox(
            height: Spacing.standard,
          ),
          title(text: ViewConstants.size),
          const SizedBox(
            height: Spacing.normal,
          ),
          SizedBox(
            width: 368,
            child: Wrap(
              spacing: Spacing.normal,
              runSpacing: Spacing.normal,
              children: [
                categoryItem(ViewConstants.small),
                categoryItem(ViewConstants.medium),
                categoryItem(ViewConstants.large),
                categoryItem(ViewConstants.xlarge),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            height: 40,
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  ViewConstants.apply.toUpperCase(),
                  style: const TextStyle(color: AppColors.white),
                )),
          )
        ],
      ),
    );
  }

  CustomInkWell categoryItem(String text) {
    bool isSelected = text == selectedCategoryValue;
    return CustomInkWell(
        onTap: () {
          selectedCategoryValue = text;
          setState(() {});
        },
        child: selectableItem(text, isSelected: isSelected));
  }

  CustomInkWell sizeItem(String text) {
    bool isSelected = text == selectedSizeValue;
    return CustomInkWell(
        onTap: () {
          selectedSizeValue = text;
          setState(() {});
        },
        child: selectableItem(text, isSelected: isSelected));
  }

  Row selectableItem(String text, {bool isSelected = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: Spacing.small, horizontal: Spacing.medium),
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.border,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                  color: AppColors.secondary, fontSize: FontSize.regular),
            ),
          ),
        ),
      ],
    );
  }

  Text title({required String text}) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(fontSize: FontSize.medium),
    );
  }

  Container textField({String? hintText, String? initialValue}) {
    return Container(
      width: 360 / 2,
      color: AppColors.border,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: hintText?.toUpperCase(),
            hintStyle: const TextStyle(fontSize: FontSize.medium),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: Spacing.standard)),
      ),
    );
  }
}

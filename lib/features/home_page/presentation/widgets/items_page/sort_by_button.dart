import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/items_page/filters_tile_item.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/items_page/sorting_list_items.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class SortByButton extends StatefulWidget {
  const SortByButton({
    super.key,
  });

  @override
  State<SortByButton> createState() => _SortByButtonState();
}

class _SortByButtonState extends State<SortByButton> {
  List<String> sortingOptions = [
    ViewConstants.ascendingOrder,
    ViewConstants.descendingOrder
  ];
  @override
  Widget build(BuildContext context) {
    return FiltersTileItem(
        showDarkColor: true,
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const SortingListItems(),
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
}

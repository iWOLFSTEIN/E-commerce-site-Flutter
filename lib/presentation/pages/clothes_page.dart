import 'package:e_commerce_site/shared/constants/app_assets.dart';
import 'package:e_commerce_site/shared/constants/app_colors.dart';
import 'package:e_commerce_site/shared/constants/app_icons.dart';
import 'package:e_commerce_site/shared/constants/font_size.dart';
import 'package:e_commerce_site/shared/constants/spacing.dart';
import 'package:e_commerce_site/shared/constants/view_constants.dart';
import 'package:e_commerce_site/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class ClothesPage extends StatefulWidget {
  const ClothesPage({super.key});

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        )
      ],
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
      "Engine",
      "20\$ - 40\$",
      "Size M",
      "Engine",
      "20\$ - 40\$",
      "Size M",
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

    List<Widget> filtersWidgetList = [filtersButton()];
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
        child: Row(
      children: [
        Text(
          ViewConstants.sortBy.toUpperCase(),
          style: const TextStyle(
              color: AppColors.primary, fontSize: FontSize.regular),
        ),
        const SizedBox(
          width: Spacing.normal,
        ),
        const Icon(
          Icons.add,
          color: AppColors.primary,
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

  Widget filtersButton() {
    return filtersTileItem(
      showDarkColor: true,
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
          const CircleAvatar(
            backgroundColor: AppColors.background,
            radius: 10,
            child: Center(
              child: Text(
                '0',
                style: TextStyle(
                    color: AppColors.primary, fontSize: FontSize.regular),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget filtersTileItem({required Widget child, bool showDarkColor = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              right: Spacing.medium, bottom: Spacing.medium),
          child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.regular, vertical: Spacing.small),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  color: showDarkColor ? AppColors.primary : null,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: child),
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

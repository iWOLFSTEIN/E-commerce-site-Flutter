import 'package:e_commerce_site/shared/constants/app_colors.dart';
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
        pageHeading(context),
        const SizedBox(
          height: Spacing.standard * 1.75,
        ),
        filtersTile(context),
        const SizedBox(
          height: Spacing.medium,
        ),
        const Divider(
          color: AppColors.border,
        )
      ],
    );
  }

  Row filtersTile(BuildContext context) {
    return Row(
      children: [
        filtersButton(),
        SizedBox(
          width: Responsive.width(context) * 1,
        ),
        Container(
          color: AppColors.primary,
          height: 25,
          width: 1,
        ),
        SizedBox(
          width: Responsive.width(context) * 1,
        ),
        filterItem("20\$ - 40\$")
      ],
    );
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
        Text(
          'x',
          style: const TextStyle(
              color: AppColors.primary, fontSize: FontSize.regular),
        ),
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

  Container filtersTileItem(
      {required Widget child, bool showDarkColor = false}) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Spacing.regular, vertical: Spacing.small),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            color: showDarkColor ? AppColors.primary : null,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: child);
  }

  Wrap pageHeading(BuildContext context) {
    return Wrap(
      // crossAxisAlignment: CrossAxisAlignment.start,
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

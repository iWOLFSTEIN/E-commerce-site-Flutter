import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:flutter/material.dart';

class FiltersTileItem extends StatelessWidget {
  const FiltersTileItem(
      {super.key, required this.child, this.onTap, this.showDarkColor = false});

  final Widget child;
  final Function()? onTap;
  final bool showDarkColor;

  @override
  Widget build(BuildContext context) {
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
}

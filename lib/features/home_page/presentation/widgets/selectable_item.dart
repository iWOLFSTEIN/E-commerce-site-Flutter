import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
import 'package:flutter/material.dart';

class SelectableItem extends StatelessWidget {
  const SelectableItem(
      {super.key,
      required this.text,
      this.onSelected,
      this.isSelected = false});

  final String text;
  final Function(String?)? onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        if (onSelected == null) return;
        if (isSelected) {
          onSelected!(null);
        } else {
          onSelected!(text);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: Spacing.small, horizontal: Spacing.medium),
            decoration: BoxDecoration(
                color: isSelected ? AppColors.highlight : null,
                border: Border.all(
                  color: isSelected ? AppColors.highlight : AppColors.border,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.secondary,
                    fontSize: FontSize.regular),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
import 'package:flutter/material.dart';

class ColorsSelection extends StatefulWidget {
  const ColorsSelection(
      {super.key, this.colors = const [], this.selectedColor});

  final List<Color> colors;
  final Color? selectedColor;

  @override
  State<ColorsSelection> createState() => _ColorsSelectionState();
}

class _ColorsSelectionState extends State<ColorsSelection> {
  late Color? selectedColor = widget.selectedColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ViewConstants.colors.toUpperCase(),
          style: const TextStyle(fontSize: FontSize.large),
        ),
        const SizedBox(
          height: Spacing.regular,
        ),
        Wrap(
          spacing: Spacing.medium,
          children: widget.colors.map((color) => colorItem(color)).toList(),
        )
      ],
    );
  }

  Widget colorItem(color) {
    bool isSelected = color == selectedColor;
    return CustomInkWell(
      onTap: () {
        selectedColor = color;
        setState(() {});
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: isSelected
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                      color: AppColors.white, shape: BoxShape.circle),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}

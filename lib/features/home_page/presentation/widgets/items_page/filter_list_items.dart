import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/category_title.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/category_with_selectable_items.dart';
import 'package:flutter/material.dart';

class FilterListItems extends StatefulWidget {
  const FilterListItems({Key? key}) : super(key: key);

  @override
  State<FilterListItems> createState() => _FilterListItemsState();
}

class _FilterListItemsState extends State<FilterListItems> {
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
              const CategoryTitle(text: ViewConstants.priceRange),
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
          CategoryWithSelectableItems(
            title: ViewConstants.category,
            width: 368,
            canSelectMany: true,
            onSelected: (selectedItemsList) {},
            items: const [
              ViewConstants.jackets,
              ViewConstants.shirts,
              ViewConstants.jeans,
              ViewConstants.suits,
              ViewConstants.sleepWears,
              ViewConstants.accessories
            ],
          ),
          const SizedBox(
            height: Spacing.standard,
          ),
          const CategoryTitle(text: ViewConstants.size),
          const SizedBox(
            height: Spacing.normal,
          ),
          CategoryWithSelectableItems(
            title: ViewConstants.size,
            width: 368,
            canSelectMany: true,
            onSelected: (selectedItemsList) {},
            items: const [
              ViewConstants.small,
              ViewConstants.medium,
              ViewConstants.large,
              ViewConstants.xlarge,
            ],
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

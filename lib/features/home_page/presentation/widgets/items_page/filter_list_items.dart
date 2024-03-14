import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
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

import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SortingListItems extends StatefulWidget {
  const SortingListItems({super.key});

  @override
  State<SortingListItems> createState() => _SortingListItemsState();
}

class _SortingListItemsState extends State<SortingListItems> {
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
          item(ViewConstants.ascendingOrder),
          const SizedBox(
            height: Spacing.small,
          ),
          item(ViewConstants.descendingOrder),
          const Spacer(),
          CustomTextButton(
            onPressed: () {
              context.pop();
            },
          )
        ],
      ),
    );
  }

  Row item(text) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: FontSize.medium),
            ),
          ),
        ),
        Radio<String>(value: '', groupValue: '', onChanged: (value) {})
      ],
    );
  }
}

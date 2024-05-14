import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SortingListItems extends StatefulWidget {
  const SortingListItems({super.key});

  @override
  State<SortingListItems> createState() => _SortingListItemsState();
}

class _SortingListItemsState extends State<SortingListItems> {
  String? selectedSortingValue;

  @override
  void initState() {
    super.initState();
    final productBloc = context.read<ProductBloc>();
    selectedSortingValue = productBloc.sort;
  }

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
            onPressed: getSortedProducts,
          )
        ],
      ),
    );
  }

  Widget item(String text) {
    return CustomInkWell(
      onTap: () {
        selectRadioItem(text);
      },
      child: Container(
        color: AppColors.white.withOpacity(0.0),
        child: Row(
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
            Radio<String>(
                value: text.toUpperCase(),
                groupValue: selectedSortingValue?.toUpperCase(),
                onChanged: null,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return AppColors.primary;
                }))
          ],
        ),
      ),
    );
  }

  void selectRadioItem(String text) {
    selectedSortingValue = text;
    setState(() {});
  }

  void getSortedProducts() {
    if (selectedSortingValue == null) {
      context.pop();
      return;
    }
    final productBloc = context.read<ProductBloc>();
    productBloc.add(GetProducts(
        category: productBloc.category, sort: selectedSortingValue!));
    context.pop();
  }
}

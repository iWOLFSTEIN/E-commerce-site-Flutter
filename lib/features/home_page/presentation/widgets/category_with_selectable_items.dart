import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/category_title.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/selectable_item.dart';
import 'package:flutter/material.dart';

class CategoryWithSelectableItems extends StatefulWidget {
  const CategoryWithSelectableItems({
    super.key,
    this.items = const [],
    this.canSelectMany = false,
    this.onSelected,
    this.width,
    required this.title,
  });

  final List<String> items;
  final bool canSelectMany;
  final Function(List)? onSelected;
  final double? width;
  final String title;

  @override
  State<CategoryWithSelectableItems> createState() =>
      _CategoryWithSelectableItemsState();
}

class _CategoryWithSelectableItemsState
    extends State<CategoryWithSelectableItems> {
  Set selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryTitle(text: widget.title),
        const SizedBox(
          height: Spacing.normal,
        ),
        SizedBox(
          width: widget.width,
          child: Wrap(
            spacing: Spacing.normal,
            runSpacing: Spacing.normal,
            children: widget.items
                .map((item) => SelectableItem(
                      text: item,
                      isSelected: selectedItems.contains(item),
                      onSelected: (value) {
                        if (widget.onSelected == null) return;
                        if (value == null) {
                          selectedItems.remove(item);
                          widget.onSelected!(selectedItems.toList());
                          setState(() {});
                          return;
                        }

                        if (widget.canSelectMany) {
                          selectedItems.add(value);
                        } else {
                          selectedItems.clear();
                          selectedItems.add(value);
                        }
                        widget.onSelected!(selectedItems.toList());
                        setState(() {});
                      },
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

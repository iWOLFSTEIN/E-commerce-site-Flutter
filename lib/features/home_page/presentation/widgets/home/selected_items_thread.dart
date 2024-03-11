import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class SelectedItemsThread extends StatefulWidget {
  const SelectedItemsThread({
    super.key,
  });

  @override
  State<SelectedItemsThread> createState() => _SelectedItemsThreadState();
}

class _SelectedItemsThreadState extends State<SelectedItemsThread> {
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    final List<String> thread = [ViewConstants.men, ViewConstants.clothes];

    if (thread.isEmpty) return Container();

    return Row(
      children: thread.map((text) {
        bool isNotLastItem = text != thread.last;
        bool isSecondLastItem = false;
        try {
          isSecondLastItem = text == thread[thread.length - 2];
        } catch (e) {
          null;
        }

        return threadItem(text,
            isNotLastItem: isNotLastItem, isSecondLastItem: isSecondLastItem);
      }).toList(),
    );
  }

  Row threadIcon({required bool isSecondLastItem}) {
    return Row(
      children: [
        SizedBox(
          width: Responsive.width(context) * 0.5,
        ),
        Icon(
          Icons.arrow_forward,
          color: isSecondLastItem ? AppColors.primary : AppColors.secondary,
          size: 12,
        ),
        SizedBox(
          width: Responsive.width(context) * 0.5,
        ),
      ],
    );
  }

  Row threadItem(String title,
      {required bool isNotLastItem, required bool isSecondLastItem}) {
    return Row(
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
              color: isNotLastItem ? AppColors.secondary : AppColors.primary,
              fontSize: FontSize.regular),
        ),
        if (isNotLastItem) threadIcon(isSecondLastItem: isSecondLastItem)
      ],
    );
  }

  void onHover(isHovering) {
    if (isHovering) {
      textColor = AppColors.highlight;
    } else {
      textColor = null;
    }
    setState(() {});
  }
}

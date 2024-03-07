import 'package:e_commerce_site/presentation/widgets/custom_ink_well.dart';
import 'package:e_commerce_site/presentation/widgets/decorated_text.dart';
import 'package:e_commerce_site/shared/constants/app_colors.dart';
import 'package:e_commerce_site/shared/constants/spacing.dart';
import 'package:e_commerce_site/shared/constants/view_constants.dart';
import 'package:flutter/material.dart';

class PaginationControls extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNextPressed;
  final VoidCallback onPrevPressed;
  final Function(int) onPageSelected;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNextPressed,
    required this.onPrevPressed,
    required this.onPageSelected,
  });

  @override
  State<PaginationControls> createState() => _PaginationControlsState();
}

class _PaginationControlsState extends State<PaginationControls> {
  Color color = AppColors.secondary;
  int currentHoverPageNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedText(text: ViewConstants.prev, onTap: widget.onPrevPressed),
        const SizedBox(width: Spacing.standard * 2),
        for (int i = 1; i <= widget.totalPages; i++) pageNumber(i),
        const SizedBox(width: Spacing.standard * 2),
        DecoratedText(text: ViewConstants.next, onTap: widget.onNextPressed),
      ],
    );
  }

  CustomInkWell pageNumber(int i) {
    return CustomInkWell(
      onHover: i == widget.currentPage
          ? null
          : (isHovering) {
              onHover(isHovering, i);
            },
      onTap: i == widget.currentPage ? null : () => widget.onPageSelected(i),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.regular),
        child: Text(
          '$i',
          style: TextStyle(
            color: i == widget.currentPage
                ? AppColors.primary
                : currentHoverPageNumber != i
                    ? AppColors.secondary
                    : color,
          ),
        ),
      ),
    );
  }

  void onHover(isHovering, currentPageNumber) {
    if (isHovering) {
      color = AppColors.highlight;
    } else {
      color = AppColors.secondary;
    }
    currentHoverPageNumber = currentPageNumber;
    setState(() {});
  }
}

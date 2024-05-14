import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/decorated_text.dart';
import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
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
  List<int> pageNumbersVisibilityList = [];

  @override
  void initState() {
    super.initState();
    setPageNumberVisibilityList();
  }

  void setPageNumberVisibilityList() {
    for (int page = 1; page <= widget.totalPages; page++) {
      pageNumbersVisibilityList.add(page);
      if (page == 3) break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedText(
            text: ViewConstants.prev,
            onTap: () {
              int prevPage = widget.currentPage - 1;
              if (prevPage < widget.totalPages && prevPage > 0) {
                if (!pageNumbersVisibilityList.contains(prevPage)) {
                  pageNumbersVisibilityList.removeLast();
                  pageNumbersVisibilityList.insert(0, prevPage);
                }
              }
              widget.onPrevPressed();
            }),
        const SizedBox(width: Spacing.standard * 2),
        if (widget.totalPages < 4)
          for (int i = 1; i <= widget.totalPages; i++) pageNumber(i)
        else
          manyPages(),
        const SizedBox(width: Spacing.standard * 2),
        DecoratedText(
            text: ViewConstants.next,
            onTap: () {
              int nextPage = widget.currentPage + 1;
              if (nextPage < widget.totalPages) {
                if (!pageNumbersVisibilityList.contains(nextPage)) {
                  pageNumbersVisibilityList.removeAt(0);
                  pageNumbersVisibilityList.add(nextPage);
                }
              }
              widget.onNextPressed();
            }),
      ],
    );
  }

  Row manyPages() {
    List<Widget> widgetsList = [];
    for (int page in pageNumbersVisibilityList) {
      widgetsList.add(pageNumber(page));
    }
    const periodsText = Text(
      "...",
      style: TextStyle(color: AppColors.secondary),
    );

    widgetsList.add(periodsText);
    widgetsList.add(pageNumber(widget.totalPages));

    return Row(
      children: widgetsList,
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

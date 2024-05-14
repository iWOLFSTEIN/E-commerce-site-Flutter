import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget(
      {super.key,
      required this.rating,
      this.ratingCount = 0,
      this.isProductRating = true,
      this.ratingIconSize = 17,
      this.ratingIconsSpacing = Spacing.xsmall});

  final int rating;
  final int ratingCount;
  final bool isProductRating;
  final double ratingIconSize;
  final double ratingIconsSpacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: ratingIconsSpacing,
          children: [
            for (int i = 1; i <= 5; i++)
              Icon(
                i <= rating ? Icons.star : Icons.star_border,
                color: i <= rating ? AppColors.highlight : AppColors.border,
                size: ratingIconSize,
              )
          ],
        ),
        if (isProductRating)
          Column(
            children: [
              const SizedBox(
                width: Spacing.medium,
              ),
              Text(
                '$ratingCount ${ViewConstants.reviews.toLowerCase()}',
                style: const TextStyle(
                    color: AppColors.secondary, fontSize: FontSize.regular),
              )
            ],
          ),
      ],
    );
  }
}

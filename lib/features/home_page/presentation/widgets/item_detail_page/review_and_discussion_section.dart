import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/decorated_text.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class ReviewAndDiscussionSection extends StatefulWidget {
  const ReviewAndDiscussionSection({
    super.key,
  });

  @override
  State<ReviewAndDiscussionSection> createState() =>
      _ReviewAndDiscussionSectionState();
}

class _ReviewAndDiscussionSectionState
    extends State<ReviewAndDiscussionSection> {
  String sortBy = ViewConstants.newest;
  @override
  Widget build(BuildContext context) {
    heading() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ViewConstants.reviews.toUpperCase(),
              style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: FontSize.large,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              ViewConstants.discussions.toUpperCase(),
              style: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: FontSize.large,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
          ],
        );

    sortItem(value) => PopupMenuItem(
          value: value,
          child: ListTile(
            title: Text(value),
          ),
        );

    sortReviews() => Row(
          children: [
            PopupMenuButton(
              color: AppColors.background,
              initialValue: sortBy,
              onSelected: (value) {
                sortBy = value as String;
                setState(() {});
              },
              itemBuilder: (context) {
                return [
                  sortItem(ViewConstants.newest),
                  sortItem(ViewConstants.highestRated),
                  sortItem(ViewConstants.lowestRated),
                  sortItem(ViewConstants.mostRelevant),
                  sortItem(ViewConstants.verifiedPurchases),
                ];
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.standard, vertical: Spacing.medium),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: AppColors.border)),
                child: Row(
                  children: [
                    Text(sortBy),
                    const SizedBox(
                      width: Spacing.standard,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
    return SizedBox(
      width: 404,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(),
          const SizedBox(
            height: Spacing.standard * 2,
          ),
          sortReviews(),
          for (int i = 0; i < 10; i++) reviewItem(),
          const SizedBox(
            height: Spacing.standard * 2,
          ),
          DecoratedText(
            text: ViewConstants.showMore,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Container reviewItem() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border))),
      child: comment(),
    );
  }

  Padding comment() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.standard * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.surface,
            backgroundImage: NetworkImage(
                'https://t4.ftcdn.net/jpg/05/62/99/31/360_F_562993122_e7pGkeY8yMfXJcRmclsoIjtOoVDDgIlh.jpg'),
          ),
          const SizedBox(
            width: Spacing.normal,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Cat Wick',
                      style: TextStyle(fontSize: FontSize.medium),
                    ),
                    SizedBox(
                      width: Spacing.normal,
                    ),
                    Text(
                      '2 days ago',
                      style: TextStyle(
                          fontSize: FontSize.small, color: AppColors.secondary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Spacing.xsmall,
                ),
                const RatingWidget(
                  rating: 5,
                  isProductRating: false,
                  ratingIconSize: 12,
                  ratingIconsSpacing: Spacing.xxsmall,
                ),
                const SizedBox(
                  height: Spacing.standard,
                ),
                const Text(
                  'Excellent product, very good quality and delivery was fast too',
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                commentActionTile(),
                Column(
                  children: [replyComment()],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding replyComment() {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.standard * 1.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.surface,
            backgroundImage: NetworkImage(
                'https://t4.ftcdn.net/jpg/05/62/99/31/360_F_562993122_e7pGkeY8yMfXJcRmclsoIjtOoVDDgIlh.jpg'),
          ),
          const SizedBox(
            width: Spacing.normal,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Cat Wick',
                      style: TextStyle(fontSize: FontSize.medium),
                    ),
                    SizedBox(
                      width: Spacing.normal,
                    ),
                    Text(
                      '2 days ago',
                      style: TextStyle(
                          fontSize: FontSize.small, color: AppColors.secondary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Spacing.xsmall,
                ),
                const RatingWidget(
                  rating: 5,
                  isProductRating: false,
                  ratingIconSize: 12,
                  ratingIconsSpacing: Spacing.xxsmall,
                ),
                const SizedBox(
                  height: Spacing.standard,
                ),
                const Text(
                  'Excellent product, very good quality and delivery was fast too',
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                commentActionTile(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row commentActionTile() {
    return const Row(
      children: [
        Text(
          ViewConstants.reply,
          style:
              TextStyle(color: AppColors.secondary, fontSize: FontSize.regular),
        ),
        SizedBox(
          width: Spacing.regular,
        ),
        Icon(
          Icons.thumb_up_alt_outlined,
          color: AppColors.secondary,
          size: 16,
        ),
        SizedBox(
          width: Spacing.small,
        ),
        Text(
          '12',
          style: TextStyle(fontSize: FontSize.regular),
        ),
        SizedBox(
          width: Spacing.regular,
        ),
        Icon(
          Icons.thumb_down_alt_outlined,
          color: AppColors.secondary,
          size: 16,
        ),
        SizedBox(
          width: Spacing.small,
        ),
        Text(
          '0',
          style: TextStyle(fontSize: FontSize.regular),
        ),
      ],
    );
  }
}

import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_item/selected_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedItemCubit, SelectedItemCubitState>(
      builder: (context, state) {
        if (state is! SelectedItemCubitDone) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final headerImage = state.product?.image ?? '';
        final title = state.product?.title ?? '';
        dynamic rate = state.product?.rating.rate ?? 0.0;
        final rating = rate.round();
        final ratingCount = state.product?.rating.count ?? 0;

        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 1024,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      itemImages(headerImage),
                      const SizedBox(
                        width: Spacing.standard * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title.toUpperCase(),
                            style: const TextStyle(fontSize: FontSize.heading),
                          ),
                          const SizedBox(
                            height: Spacing.regular,
                          ),
                          // Row(
                          //   children: [
                          Wrap(
                            spacing: Spacing.small,
                            children: [
                              for (int i = 1; i <= 5; i++)
                                Icon(
                                  i <= rating ? Icons.star : Icons.star_border,
                                  color: i <= rating
                                      ? AppColors.highlight
                                      : AppColors.border,
                                  size: 18,
                                )
                            ],
                          ),
                          //     const SizedBox(
                          //       width: double.infinity,
                          //     ),
                          //     Text('$ratingCount ')
                          //   ],
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget itemImages(String imageUrl) {
    if (imageUrl.isEmpty) return Container();
    return Column(
      children: [
        headerImage(imageUrl),
        const SizedBox(
          height: Spacing.standard,
        ),
        Row(
          children: [
            subImage(imageUrl),
            const SizedBox(
              width: Spacing.normal,
            ),
            subImage(imageUrl),
            const SizedBox(
              width: Spacing.normal,
            ),
            subImage(imageUrl),
            const SizedBox(
              width: Spacing.normal,
            ),
            morePics(),
          ],
        ),
      ],
    );
  }

  Container subImage(String imageUrl) {
    return Container(
      height: 95,
      width: 95,
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container headerImage(String imageUrl) {
    return Container(
      height: 404,
      width: 404,
      decoration: const BoxDecoration(
        color: AppColors.placeholder,
        borderRadius: BorderRadius.all(Radius.circular(7.5)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget morePics() {
    const remainingPicsCount = 4;
    return Container(
      height: 95,
      width: 95,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
      ),
      child: const Text(
        '+$remainingPicsCount more',
        style: TextStyle(
          fontSize: FontSize.medium,
        ),
      ),
    );
  }
}

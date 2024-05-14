import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:e_commerce_site/core/utils/responsive.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_items_thread.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsPageHeading extends StatelessWidget {
  const ItemsPageHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        BlocBuilder<SelectedItemsThreadCubit, List>(
          builder: (context, thread) {
            return Text(
              thread.last.toUpperCase(),
              style: const TextStyle(fontSize: FontSize.large * 4, height: 1),
            );
          },
        ),
        SizedBox(
          width: Responsive.width(context) * 0.75,
        ),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductsDone) {
              final int itemsCount = state.products.length;
              return Text(
                "$itemsCount ${ViewConstants.results}".toUpperCase(),
                style: const TextStyle(fontSize: FontSize.large),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}

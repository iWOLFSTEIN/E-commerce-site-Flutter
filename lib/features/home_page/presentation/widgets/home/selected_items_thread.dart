import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/core/utils/responsive.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_items_thread.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectedItemsThread extends StatefulWidget {
  const SelectedItemsThread({
    super.key,
  });

  @override
  State<SelectedItemsThread> createState() => _SelectedItemsThreadState();
}

class _SelectedItemsThreadState extends State<SelectedItemsThread> {
  Color textColor = AppColors.secondary;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedItemsThreadCubit, List>(
      builder: (context, thread) {
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
                isNotLastItem: isNotLastItem,
                isSecondLastItem: isSecondLastItem);
          }).toList(),
        );
      },
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
        CustomInkWell(
          onTap: isNotLastItem ? onTap : null,
          onHover: onHover,
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
                color: isNotLastItem ? textColor : AppColors.primary,
                fontSize: FontSize.regular),
          ),
        ),
        if (isNotLastItem) threadIcon(isSecondLastItem: isSecondLastItem)
      ],
    );
  }

  void onHover(isHovering) {
    if (isHovering) {
      textColor = AppColors.highlight;
    } else {
      textColor = AppColors.secondary;
    }
    setState(() {});
  }

  void onTap() {
    goToItemsPage();
    getAllTheProducts();
    clearSelectionThread();
  }

  void goToItemsPage() {
    context.goNamed('itemsPage');
  }

  void getAllTheProducts() {
    final productsBloc = context.read<ProductBloc>();
    productsBloc.add(const GetProducts());
  }

  void clearSelectionThread() {
    final selectedItemsThreadCubit = context.read<SelectedItemsThreadCubit>();
    selectedItemsThreadCubit.removeLastItemFromThread();
  }
}

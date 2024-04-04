import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/font_size.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_items_thread.dart';
import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarMenuItem extends StatefulWidget {
  const AppBarMenuItem(
      {super.key, required this.title, this.isSelected = false});
  final String title;
  final bool isSelected;

  @override
  State<AppBarMenuItem> createState() => _AppBarMenuItemState();
}

class _AppBarMenuItemState extends State<AppBarMenuItem> {
  Color? color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedItemsThreadCubit, List>(
      builder: (context, state) {
        bool isAppBarMenuItemSelected = false;
        if (state.isNotEmpty) {
          isAppBarMenuItemSelected =
              widget.title.toLowerCase() == state.last.toString().toLowerCase();
        }
        return CustomInkWell(
          onHover: onHover,
          onTap: onTap,
          child: Text(widget.title.toUpperCase(),
              style: TextStyle(
                  fontSize: FontSize.regular,
                  color:
                      isAppBarMenuItemSelected ? AppColors.highlight : color)),
        );
      },
    );
  }

  void onHover(isHovering) {
    if (isHovering) {
      color = AppColors.highlight;
    } else {
      color = null;
    }
    setState(() {});
  }

  void onTap() {
    getProductsFromCategory();
    setSelectionThreadState();
  }

  void getProductsFromCategory() {
    final productsBloc = BlocProvider.of<ProductBloc>(context);
    productsBloc
      ..add(const ClearAllProducts())
      ..add(GetProducts(category: widget.title));
  }

  void setSelectionThreadState() {
    final selectedItemsThreadCubit =
        BlocProvider.of<SelectedItemsThreadCubit>(context);

    if (selectedItemsThreadCubit.state.length > 1) {
      selectedItemsThreadCubit.removeLastItemFromThread();
    }
    if (selectedItemsThreadCubit.state.contains(widget.title)) return;
    selectedItemsThreadCubit.addItemToThread(item: widget.title);
  }
}

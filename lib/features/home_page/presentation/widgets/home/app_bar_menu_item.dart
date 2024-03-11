import 'package:e_commerce_site/shared/constants/app_colors.dart';
import 'package:e_commerce_site/shared/constants/font_size.dart';
import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          hoverColor: AppColors.background,
          highlightColor: AppColors.background,
          splashColor: AppColors.background,
          onHover: onHover,
          onTap: () {},
          child: Text(widget.title.toUpperCase(),
              style: TextStyle(fontSize: FontSize.regular, color: color)),
        ),
      ],
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
}

import 'package:e_commerce_site/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell(
      {super.key,
      required this.child,
      this.onHover,
      this.onTap,
      this.focusColor = AppColors.white,
      this.hoverColor = AppColors.white,
      this.splashColor = AppColors.white});

  final Widget child;
  final void Function(bool)? onHover;
  final void Function()? onTap;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? focusColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: hoverColor,
      splashColor: splashColor,
      focusColor: focusColor,
      onHover: onHover,
      onTap: onTap,
      child: child,
    );
  }
}

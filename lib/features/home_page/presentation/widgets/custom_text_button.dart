import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      height: 40,
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            ViewConstants.apply.toUpperCase(),
            style: const TextStyle(color: AppColors.white),
          )),
    );
  }
}

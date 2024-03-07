import 'package:e_commerce_site/presentation/widgets/custom_ink_well.dart';
import 'package:e_commerce_site/shared/constants/app_colors.dart';
import 'package:e_commerce_site/shared/constants/spacing.dart';
import 'package:flutter/material.dart';

class DecoratedText extends StatefulWidget {
  const DecoratedText({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  State<DecoratedText> createState() => _ShowMoreButtonState();
}

class _ShowMoreButtonState extends State<DecoratedText> {
  Color? color;
  Color? decorationColor;
  late final onTap = widget.onTap ?? () {};
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Spacing.standard),
      child: CustomInkWell(
        onHover: onHover,
        onTap: onTap,
        child: Text(
          widget.text,
          style: TextStyle(
              color: color,
              decoration: TextDecoration.underline,
              decorationColor: color),
        ),
      ),
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

import 'package:e_commerce_site/features/home_page/presentation/widgets/custom_ink_well.dart';
import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:e_commerce_site/core/constants/spacing.dart';
import 'package:flutter/material.dart';

class DecoratedText extends StatefulWidget {
  const DecoratedText({
    super.key,
    required this.text,
    this.onTap,
    this.fontSize,
    this.color,
    this.applyHover = true,
    this.isDecorated = true,
  });

  final String text;
  final void Function()? onTap;
  final double? fontSize;
  final Color? color;
  final bool applyHover;
  final bool isDecorated;

  @override
  State<DecoratedText> createState() => _ShowMoreButtonState();
}

class _ShowMoreButtonState extends State<DecoratedText> {
  late Color? color = widget.color;
  Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Spacing.standard),
      child: CustomInkWell(
        onHover: widget.applyHover ? onHover : null,
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: TextStyle(
              color: color,
              decoration: widget.isDecorated ? TextDecoration.underline : null,
              decorationColor: widget.isDecorated ? color : null,
              fontSize: widget.fontSize),
        ),
      ),
    );
  }

  void onHover(isHovering) {
    if (isHovering) {
      color = AppColors.highlight;
    } else {
      color = widget.color;
    }
    setState(() {});
  }
}

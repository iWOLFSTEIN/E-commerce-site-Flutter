import 'package:e_commerce_site/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData theme() => ThemeData(
        colorScheme: AppColors.colorSchemeLight,
        useMaterial3: true,
      );
}

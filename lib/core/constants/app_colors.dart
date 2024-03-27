import 'package:flutter/material.dart';

class AppColors {
  static const ColorScheme colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: white,
    secondary: secondary,
    onSecondary: white,
    error: error,
    onError: white,
    background: background,
    onBackground: primary,
    surface: surface,
    onSurface: primary,
  );

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color primary = Color(0xFF212123);
  static const Color secondary = Color(0xFFA4A4A4);
  static const Color background = Color(0xFFFFFFFF);

  static const Color error = Color(0xFFB00020);
  static const Color highlight = Color(0xFFEDCF5D);
  static const Color border = Color(0xFFE1E3E5);
  static const Color surface = Color(0xFFE3E3E3);

  static const Color placeholder = Color(0xFFF4F4F4);
  static const Color banner = Color(0xFFd7d2bf);
}

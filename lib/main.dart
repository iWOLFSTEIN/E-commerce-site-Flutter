import 'package:e_commerce_site/config/theme/app_themes.dart';
import 'package:e_commerce_site/features/home_page/presentation/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.theme(),
      home: const Home(),
    );
  }
}

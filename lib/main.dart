import 'package:e_commerce_site/config/theme/app_themes.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/pages/home.dart';
import 'package:e_commerce_site/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
            create: (context) => sl()..add(const GetProducts()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.theme(),
        home: const Home(),
      ),
    );
  }
}

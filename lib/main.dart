import 'package:e_commerce_site/config/router/app_router.dart';
import 'package:e_commerce_site/config/theme/app_themes.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/categories/categories_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_item/selected_item.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_items_thread.dart';
import 'package:e_commerce_site/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

final Logger logger = Logger();

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
            create: (context) => sl()..add(const GetProducts())),
        BlocProvider<CategoriesBloc>(
            create: (context) => sl()..add(const GetCategories())),
        BlocProvider<SelectedItemsThreadCubit>(create: (context) => sl()),
        BlocProvider<SelectedItemCubit>(create: (context) => sl()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.theme(),
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
      ),
    );
  }
}

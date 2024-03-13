import 'package:dio/dio.dart';
import 'package:e_commerce_site/core/utils/console_log.dart';
import 'package:e_commerce_site/features/home_page/data/data_source/remote/categories_api_service.dart';
import 'package:e_commerce_site/features/home_page/data/data_source/remote/products_api_service.dart';
import 'package:e_commerce_site/features/home_page/data/repository/categories_repository_impl.dart';
import 'package:e_commerce_site/features/home_page/data/repository/product_repository_impl.dart';
import 'package:e_commerce_site/features/home_page/domain/repository/categories_repository.dart';
import 'package:e_commerce_site/features/home_page/domain/repository/product_repository.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_categories_use_case.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_products.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/categories/categories_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/blocs/product/product_bloc.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/cubits/selected_items_thread/selected_items_thread_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<Logger>(Logger());

  // Dependencies
  sl.registerSingleton<ProductsApiService>(ProductsApiService(sl()));
  sl.registerSingleton<ProductRepository>(ProductRespositoryImpl(sl()));

  sl.registerSingleton<CategoriesApiService>(CategoriesApiService(sl()));
  sl.registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl(sl()));

  sl.registerSingleton<ConsoleLog>(ConsoleLog(sl()));

  //UseCases
  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase(sl()));

  //Blocs
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
  sl.registerFactory<CategoriesBloc>(() => CategoriesBloc(sl()));

  //Cubits
  sl.registerFactory<SelectedItemsThreadCubit>(
      () => SelectedItemsThreadCubit());
}

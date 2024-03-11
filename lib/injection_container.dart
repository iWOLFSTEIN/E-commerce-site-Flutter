import 'package:dio/dio.dart';
import 'package:e_commerce_site/features/home_page/data/data_source/remote/products_api_service.dart';
import 'package:e_commerce_site/features/home_page/data/repository/product_repository_impl.dart';
import 'package:e_commerce_site/features/home_page/domain/repository/product_repository.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_products.dart';
import 'package:e_commerce_site/features/home_page/presentation/bloc/product/remote/product_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ProductsApiService>(ProductsApiService(sl()));
  sl.registerSingleton<ProductRepository>(ProductRespositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));

  //Blocs
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
}

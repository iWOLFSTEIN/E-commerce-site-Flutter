import 'package:e_commerce_site/core/resources/api_error_handler.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/data/data_source/remote/categories_api_service.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/categories.dart';
import 'package:e_commerce_site/features/home_page/domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesApiService _categoriesApiService;
  CategoriesRepositoryImpl(this._categoriesApiService);

  @override
  Future<DataState<CategoriesEntity>> getCategories() async {
    return await ApiErrorHandler.onNetworkRequest(fetch: () async {
      final res = await _categoriesApiService.getCategories();
      return res;
    });
  }
}

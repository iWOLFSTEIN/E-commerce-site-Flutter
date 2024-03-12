import 'package:dio/dio.dart';
import 'package:e_commerce_site/core/constants/api_endpoints.dart';
import 'package:e_commerce_site/features/home_page/data/models/categories.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
part 'categories_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio) = _CategoriesApiService;

  @GET('/categories')
  Future<HttpResponse<CategoriesModel>> getCategories();
}

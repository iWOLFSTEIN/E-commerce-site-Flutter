import 'package:dio/dio.dart';
import 'package:e_commerce_site/core/constants/api_endpoints.dart';
import 'package:e_commerce_site/features/home_page/data/models/product.dart';
import 'package:retrofit/retrofit.dart';
part 'products_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio) = _ProductsApiService;

  @GET('/products')
  Future<HttpResponse<List<ProductModel>>> getProducts();
}

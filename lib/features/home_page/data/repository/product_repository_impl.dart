import 'package:e_commerce_site/core/resources/error_handler.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/data/data_source/remote/products_api_service.dart';
import 'package:e_commerce_site/features/home_page/data/models/product.dart';
import 'package:e_commerce_site/features/home_page/domain/repository/product_repository.dart';

class ProductRespositoryImpl extends ProductRepository {
  final ProductsApiService _productsApiService;
  ProductRespositoryImpl(this._productsApiService);

  @override
  Future<DataState<List<ProductModel>>> getProducts({String? sort}) async {
    final dataState = await ErrorHandler.onNetworkRequest<List<ProductModel>>(
        fetch: () async {
      return await _productsApiService.getProducts(sort: sort);
    });

    return dataState;
  }

  @override
  Future<DataState<List<ProductModel>>> getProductsFromCategory(String category,
      {String? sort}) async {
    final dataState = await ErrorHandler.onNetworkRequest<List<ProductModel>>(
        fetch: () async {
      return await _productsApiService.getProductsFromCategory(category,
          sort: sort);
    });

    return dataState;
  }
}

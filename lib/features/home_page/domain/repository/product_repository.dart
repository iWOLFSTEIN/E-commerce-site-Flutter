import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts({String? sort});
  Future<DataState<List<ProductEntity>>> getProductsFromCategory(
      String category,
      {String? sort});
}

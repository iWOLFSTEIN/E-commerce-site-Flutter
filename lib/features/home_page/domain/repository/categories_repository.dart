import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/categories.dart';

abstract class CategoriesRepository {
  Future<DataState<CategoriesEntity>> getCategories();
}

import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/core/usecase/usecase.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/categories.dart';
import 'package:e_commerce_site/features/home_page/domain/repository/categories_repository.dart';

class GetCategoriesUseCase implements UseCase {
  final CategoriesRepository _categoriesRepository;

  const GetCategoriesUseCase(this._categoriesRepository);

  @override
  Future<DataState<CategoriesEntity>> call({params}) async {
    final ds = await _categoriesRepository.getCategories();
    return ds;
  }
}

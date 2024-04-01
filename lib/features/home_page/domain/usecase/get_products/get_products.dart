import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/core/usecase/usecase.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:e_commerce_site/features/home_page/domain/repository/product_repository.dart';

class GetProductsUseCase implements UseCase {
  final ProductRepository productRepository;

  const GetProductsUseCase(this.productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({params}) async {
    return await productRepository.getProducts();
  }
}

import 'package:bloc/bloc.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_products/get_products.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_products/get_products_from_category.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase _getProductsUseCase;
  final GetProductsFromCategoryUseCase _getProductsFromCategoryUseCase;

  ProductBloc(this._getProductsUseCase, this._getProductsFromCategoryUseCase)
      : super(const ProductsLoading()) {
    on<GetProducts>(onGetProducts);
    on<ClearAllProducts>(onClearAllProducts);
  }

  void onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    late DataState<List<ProductEntity>> dataState;
    if (event.category == null) {
      dataState = await _getProductsUseCase();
    } else {
      dataState = await _getProductsFromCategoryUseCase(params: event.category);
    }

    if (dataState is DataSuccess && dataState.data != null) {
      emit(ProductsDone(dataState.data!));
    } else {
      emit(ProductsException(dataState.exception!));
    }
  }

  void onClearAllProducts(ClearAllProducts event, Emitter<ProductState> emit) =>
      emit(const ProductsLoading());
}

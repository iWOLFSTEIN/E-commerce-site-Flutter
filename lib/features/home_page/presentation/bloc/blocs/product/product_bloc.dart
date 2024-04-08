import 'package:bloc/bloc.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';
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
  String? category;
  String sort = ViewConstants.ascendingOrder;

  ProductBloc(this._getProductsUseCase, this._getProductsFromCategoryUseCase)
      : super(const ProductsLoading()) {
    on<GetProducts>(onGetProducts);
  }

  void onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    emit(const ProductsLoading());
    late DataState<List<ProductEntity>> dataState;

    category = event.category;
    sort = event.sort;

    if (event.category == null) {
      dataState = await _getProductsUseCase(
          sort: event.sort.toLowerCase().substring(0, 4));
    } else {
      dataState = await _getProductsFromCategoryUseCase(
          category: event.category,
          sort: event.sort.toLowerCase().substring(0, 4));
    }

    if (dataState is DataSuccess && dataState.data != null) {
      emit(ProductsDone(dataState.data!));
    } else {
      emit(ProductsException(dataState.exception!));
    }
  }
}

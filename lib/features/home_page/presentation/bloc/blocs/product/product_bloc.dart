import 'package:bloc/bloc.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_products/get_products.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductBloc(this._getProductsUseCase) : super(const ProductsLoading()) {
    on<GetProducts>(onGetProducts);
  }

  void onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    final dataState = await _getProductsUseCase();
    if (dataState is DataSuccess) {
      emit(ProductsDone(dataState.data ?? []));
    } else {
      emit(ProductsException(dataState.exception!));
    }
  }
}

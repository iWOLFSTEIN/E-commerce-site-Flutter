import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_site/core/resources/data_state.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:e_commerce_site/features/home_page/domain/usecase/get_products.dart';
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
    print(dataState);
    if (dataState is DataSuccess) {
      print(dataState.data);
      emit(ProductsDone(dataState.data ?? []));
    } else {
      print('printing error');
      print(dataState.dioException);
      emit(ProductsException(dataState.dioException!));
    }
  }
}

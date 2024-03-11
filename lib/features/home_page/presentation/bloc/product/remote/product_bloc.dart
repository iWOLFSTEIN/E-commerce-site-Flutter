import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductsLoading()) {
    on<GetProducts>(onGetProducts);
  }

  Future onGetProducts(GetProducts event, Emitter<ProductState> emit) async {}
}

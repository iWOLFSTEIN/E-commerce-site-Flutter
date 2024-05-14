import 'package:bloc/bloc.dart';
import 'package:e_commerce_site/features/home_page/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

part 'selected_item_state.dart';

class SelectedItemCubit extends Cubit<SelectedItemCubitState> {
  SelectedItemCubit() : super(const SelectedItemCubitInitial());

  void setProduct(ProductEntity product) =>
      emit(SelectedItemCubitDone(product));

  void getProduct() => emit(state);
}

import 'package:bloc/bloc.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';

class SelectedItemsThreadCubit extends Cubit<List> {
  SelectedItemsThreadCubit() : super([ViewConstants.allProducts]);

  void addItemToThread({required String item}) =>
      emit(List.from(state)..add(item));

  void removeItemFromThread() => emit(List.from(state)..removeLast());
}

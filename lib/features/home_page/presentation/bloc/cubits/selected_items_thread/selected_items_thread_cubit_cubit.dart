import 'package:bloc/bloc.dart';
import 'package:e_commerce_site/core/constants/view_constants.dart';

class SelectedItemsThreadCubit extends Cubit<List> {
  SelectedItemsThreadCubit() : super([ViewConstants.allProducts]);

  void addItemToThread({required String item}) {
    state.add(item);
    emit(state);
  }

  void removeItemFromThread({required String item}) {
    state.remove(item);
    emit(state);
  }

  void addAllTheItems({List? items}) {
    if (items == null) return;
    for (final item in items) {
      state.add(item);
    }
  }
}

part of 'selected_item.dart';

sealed class SelectedItemCubitState extends Equatable {
  final ProductEntity? product;
  const SelectedItemCubitState({this.product});

  @override
  List<Object> get props => [product!];
}

final class SelectedItemCubitInitial extends SelectedItemCubitState {
  const SelectedItemCubitInitial();
}

final class SelectedItemCubitDone extends SelectedItemCubitState {
  const SelectedItemCubitDone(ProductEntity product) : super(product: product);
}

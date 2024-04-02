part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent({this.category});

  final String? category;

  @override
  List<Object> get props => [];
}

final class GetProducts extends ProductEvent {
  const GetProducts({super.category});
}

final class ClearAllProducts extends ProductEvent {
  const ClearAllProducts();
}

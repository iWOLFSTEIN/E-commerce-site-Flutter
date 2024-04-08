part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent({this.category, required this.sort});

  final String? category;
  final String sort;

  @override
  List<Object> get props => [];
}

final class GetProducts extends ProductEvent {
  const GetProducts(
      {super.category, super.sort = ViewConstants.ascendingOrder});
}
